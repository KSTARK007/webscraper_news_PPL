use strict;
use warnings;
use feature qw( say );
use HTML::TreeBuilder 5 -weak;
use open ':std', ':encoding(UTF-8)';
open(FILE, ">>output.txt");
printf FILE "\nDECCAN CHRONICLE NEWS\n";
my $tree = HTML::TreeBuilder->new_from_url('https://www.deccanchronicle.com/nation');
foreach my $e ($tree->look_down("class"=>"stry-hd-sml-led2")){

    printf FILE "%s\n", $e->as_text;
}
close(FILE);
