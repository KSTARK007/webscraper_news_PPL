use strict;
use warnings;
use feature qw( say );
use HTML::TreeBuilder 5 -weak;
use open ':std', ':encoding(UTF-8)';
open(FILE, ">>output.txt");
printf FILE "\nNDTV\n";
my $treetech = HTML::TreeBuilder->new_from_url('https://www.ndtv.com/');
my $c = 0;
foreach my $i ($treetech->look_down(_tag =>'h2')) {
  if($i->as_text eq "Opinion ")
  {
    last;
  }
  if($i->as_text ne "" and $c>=2){
    printf FILE "%s\n", $i->as_text;
  }
  $c = $c +1;

}
close(FILE);
