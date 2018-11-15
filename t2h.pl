#!/usr/bin/perl
use strict;
use warnings;

open my $HTML, '>', 'output.html' or die $!;

print $HTML <<'ENDHEADER';
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PEW NEWS</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
    <h1 style="color:red;" align="center">Welcome to most trusted NEWS platform on the Internet</h1>
    <div id="news-box">
    <marquee direction="right"><h2 style="color:red;">Subscribe to Pewdewpie</h2></marquee>
ENDHEADER

open my $IN, '<', 'output.txt' or die $!;
print $HTML "<br>";
print $HTML "<ul>";
while (my $line = <$IN>) {
    print $HTML "<p><span style='color:red'>";
    if ($line eq uc $line) {
        print $HTML "<br>";
        print $HTML "<h1 align='center'>";
        print $HTML $line;
        print $HTML "</h1>";
        print $HTML "<br>";
    }
    else {
        print $HTML "<li>";
        print $HTML $line;
        print $HTML "</li>";
    }
    print $HTML "</span></p>";
}
print $HTML "</ul>";
print $HTML "</div>";
print $HTML '</body></html>';
close $HTML or die $!;
