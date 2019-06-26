#! /usr/bin/perl
#
# generate a system manifest
#

use strict;

use File::Find;
use Digest::MD5;

our %config;

$| = 1;

&main;
exit;

sub initialize {
    my ($exclude_next, $include_next, @ex, @in, @ex_pats, @in_pats, %in, @x);

    # the exclude/include list looks like what you would pass to rsync
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

sub wanted {
    my($type, $extra);

    my $path = $File::Find::name;

    my @ex = grep($path =~ m"^$_", @{$config{'ex_pats'}});

    my($mode, $uid, $gid, $dev) = (lstat($path))[2,4,5,6];

    if (scalar(@ex) > 0) {
        # if we're excluding, and it was a dir, don't bother to descend
        $File::Find::prune = -d _;
        return;
    }

    $mode &= 07777;                             # mask off mode bits
    if (-d _) {
        $type = "dir ";
    } elsif (-l _) {
        $type = "link";
        $extra = "\"" . readlink($path) . "\"";
    } elsif (-f _) {
        $type = "file";
        $extra = &md5sum($path);
        return unless defined($extra);
    } elsif (-p _) {
        $type = "pipe";
    } elsif (-S _) {
        $type = "sock";
    } elsif (-b _) {
        $type = "bdev";
        $extra = "\"" . ($dev >> 8) . " " . ($dev & 0377) . "\"";
    } elsif (-c _) {
        $type = "cdev";
        $extra = "\"" . ($dev >> 8) . " " . ($dev & 0377) . "\"";
    } else {
        $type = "unk ";
    }


    printf "%s 0%04o %d %d \"%s\"", $type, $mode, $uid, $gid, $path;
    print " $extra" if $extra;
    print "\n";
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

sub main {
    &initialize;

    &find({no_chdir => 1, wanted => \&wanted}, '/');
}
