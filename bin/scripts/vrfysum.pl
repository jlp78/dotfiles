#! /usr/bin/perl

# verify that a system matches the sum file produced by chksum.pl

use strict;

use File::Find;
use Digest::MD5;
use Text::ParseWords;

our %config;

$| = 1;

&main;
exit;

sub initialize {
    my ($exclude_next, $include_next, @ex, @in, @ex_pats, @in_pats, %in, @x);

    my $elist = ['--exclude' => '/var/log',
                 '--exclude' => '/var/tmp',
                 '--exclude' => '/tmp',
                ];

    foreach my $op (@$elist) {
        if ($op eq '--exclude') {
            $exclude_next = 1;
        } elsif ($op eq '--include') {
            $include_next = 1;
        } elsif ($op eq '--delete') {
            # ignore
        } else {
            if ($exclude_next) {
                push(@ex, $op);
            } elsif ($include_next) {
                push(@in, $op);
            } else {
                warn "don't know what to do with $op\n";
            }
            $include_next = 0; $exclude_next = 0;
        }
    }

    $config{'exclude_list'} = \@ex;
    $config{'include_list'} = \@in;
    @ex_pats = map(glob($_), @ex);
    @in_pats = map(glob($_), @in);

#    print STDERR "exclusion patterns:\n", join("\n", @ex_pats), "\n\n";
#    print STDERR "inclusion patterns:\n", join("\n", @in_pats), "\n\n";

    # remove exclusions that exactly match inclusions
    foreach my $pat (@in_pats) {
        $in{$pat}++;
    }
    foreach my $pat (@ex_pats) {
        next if $in{$pat};
        push(@x, $pat);
    }

    $config{'ex_pats'} = \@x;
}

sub md5sum {
    my $file = shift;
    my $context = Digest::MD5->new;
    unless(open(F, $file)) {
        warn "WARNING: couldn't open $file: $!\n";
        return;
    }
    $context->addfile(*F);
    close(F);
    my $digest = $context->hexdigest;
    return($digest);
}

sub wanted {
    my $path = $File::Find::name;

    my @ex = grep($path =~ m"^$_", @{$config{'ex_pats'}});

    if (scalar(@ex) > 0) {
        # if we're excluding, and it was a dir, don't bother to descend
        $file::Find::prune = -d $path;
        return;
    }

    if (! $config{'seen'}->{$path}) {
        warn "new file: $path\n";
        $config{'new'}++;
    }
}

sub main {
    $config{'mismatch'} = 0;
    $config{'missing'} = 0;
    $config{'new'} = 0;

    &initialize;

    while (<>) {
        chomp;
        my ($type, $mode, $uid, $gid, $path, $extra) = &shellwords($_);
        my ($etype, $eextra);

        $mode = oct($mode);
        my($emode, $euid, $egid, $edev) = (lstat($path))[2,4,5,6];

        if (! -e _) {
            warn "missing file: $path\n";
            $config{'missing'}++;
            next;
        }

        $emode &= 07777;
        if (-d _) {
            $etype = "dir";
        } elsif (-l _) {
            $etype = "link";
            $eextra = readlink($path);
        } elsif (-f _) {
            $etype = "file";
            $eextra = &md5sum($path);
            return unless defined($eextra);
        } elsif (-p _) {
            $etype = "pipe";
        } elsif (-S _) {
            $etype = "sock";
        } elsif (-b _) {
            $etype = "bdev";
            $eextra = ($edev >> 8) . " " . ($edev & 0377);
        } elsif (-c _) {
            $etype = "cdev";
            $eextra = ($edev >> 8) . " " . ($edev & 0377);
        } else {
            $etype = "unk";
        }

        if ($type ne $etype) {
            warn "mismatch file type ($type vs $etype): $path\n";
            $config{'mismatch'}++;
        } else {
            # types are the same, compare other factors

            if ($mode != $emode) {
                warn sprintf("mismatch mode (0%o vs 0%o): %s\n", $mode, $emode, $path);
                $config{'mismatch'}++;
            }
            if ($uid != $euid) {
                warn "mismatch uid ($uid vs $euid): $path\n";
                $config{'mismatch'}++;
            }
            if ($gid != $egid) {
                warn "mismatch gid ($gid vs $egid): $path\n";
                $config{'mismatch'}++;
            }
            if ($extra ne $eextra) {
                if ($etype eq 'link') {
                    warn "mismatch link target ($extra vs $eextra): $path\n";
                } elsif ($etype eq 'file') {
                    warn "mismatch file checksum ($extra vs $eextra): $path\n";
                } elsif ($etype eq 'bdev' or $etype eq 'cdev') {
                    warn "mismatch device node ($extra vs $eextra): $path\n";
                }
                $config{'mismatch'}++;
            }
        }

        $config{'seen'}->{$path}++;
    }

    # now walk the filesystem looking for "new" files

    &find({no_chdir => 1, wanted => \&wanted}, '/');

    print "$config{'mismatch'} files changed\n";
    print "$config{'missing'} files missing\n";
    print "$config{'new'} new files\n";

    if ($config{'mismatch'} > 0 or
        $config{'missing'} > 0 or
        $config{'new'} > 0) {
        exit 1;
    }

    exit 0;
}
