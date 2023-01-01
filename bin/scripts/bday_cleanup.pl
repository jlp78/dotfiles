#! /usr/bin/perl

@ignore_names = ("Bales, Lori",
                 "Jack, Michelle");

sub read_line {
  if (@unread_buffer) {
    return(shift(@unread_buffer));
  }
  return(<>);
}

sub unread_line {
  my $line = shift;
  push(@unread_buffer, $line);
}

sub process_month {
  my($line, @lines, $bday, $mon, $name, $rec,
     $l, $lineno, $len, $current_month);

  $line = 1;
  while ($_ = &read_line()) {
    m/^(\d+) (\w+)\s+(\D+)/ or next;
    ($bday, $mon, $name) = ($1, $2, $3); # only get lines with bday and name
    $name =~ s/\s*$//;                   # strip trailing white space
    $bday = join(" ", $bday, $mon);

    # switch to next month?
    last if $current_month and $current_month ne $mon;
    $current_month = $mon;

    next if grep(m/^$name$/, @ignore_names);
    $rec = join(':', $line++, $bday, $name);
    $len = length($rec) unless length($rec) < $len;
    push(@lines, $rec);
  }

  # dump each line
  for $l (@lines) {
    ($lineno, $bday, $name) = split(m/:/, $l);
    printf("%-8s %-*s %d\n", $bday, $len, $name, $lineno);
    print("\n") if $lineno == int((scalar(@lines) + 1) / 2);
  }
}

# first month
&process_month();
&unread_line($_);               # unread the last line read
print("\n", "\n");
# second month
&process_month();
