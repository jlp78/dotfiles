#! /usr/bin/perl

$t = shift;
if (not $t =~ m/^\d+$/) {
    print "unable to decode argument...\n";
    print "usage: expand_time.pl NNN\n";
    print "       where NNN is a number of seconds\n";
    exit;
}

$out = "\n";
if ($t > 0) {
    $s = $t % 60;
    $t -= $s;
    $out = sprintf("%02d",$s) . $out;
} else {
    $out = "0" . $out;
}
if ($t > 60) {
    $t /= 60;
    $m = $t % 60;
    $t -= $m;
    $out = sprintf("%02d:", $m) . $out;
}
if ($t > 24) {
    $t /= 60;
    $h = $t % 24;
    $t -= $h;
    $out = sprintf("%2d:", $h) . $out;
}
if ($t > 0) {
    $t /= 24;
    $d = $t;
    $t -= $d;
    $out = sprintf("%dd ", $d) . $out;
}
print $out;
