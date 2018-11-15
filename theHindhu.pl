use strict;
use warnings;
use feature qw( say );
use HTML::TreeBuilder 5 -weak;
use open ':std', ':encoding(UTF-8)';
open(FILE, ">output.txt");
printf FILE "\nTHE HINDU\n";
my $tree = HTML::TreeBuilder->new_from_url('https://www.thehindu.com/news/');
foreach my $e ($tree->look_down(_tag => 'h2')) {
   if ($e->as_text eq 'National') {
     last;
   }
    printf FILE "%s\n", $e->as_text;
}
close(FILE);
