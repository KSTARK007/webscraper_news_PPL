use strict;
use warnings;
use feature qw( say );
use HTML::TreeBuilder 5 -weak;
use open ':std', ':encoding(UTF-8)';
open(FILE, ">>output.txt");
printf FILE "\nTIMES OF INDIA NEWS\n";
my $tree = HTML::TreeBuilder->new_from_url('https://timesofindia.indiatimes.com/');
foreach my $e ($tree->look_down("class"=>"top-story")){
  foreach my $k ($e->look_down(_tag =>'li')){
    printf FILE "%s\n", $k->as_text;
  }
}
printf FILE "\nTIMES OF INDIA TECH\n";
my $treetech = HTML::TreeBuilder->new_from_url('https://www.gadgetsnow.com/latest-news');
my $c = 0;
foreach my $i ($treetech->look_down("class" => 'w_tle')) {
  if($c >= 20){
    last;
  }
    printf FILE "%s\n", $i->as_text;
    $c = $c +1;
}
close(FILE);
