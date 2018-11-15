use strict;
use warnings;
use feature qw( say );
use HTML::TreeBuilder 5 -weak;
use open ':std', ':encoding(UTF-8)';
open(FILE, ">>output.txt");
printf FILE "\nWALL STREET JOURNAL\n";
my $tree = HTML::TreeBuilder->new_from_url('https://www.wsj.com/india');
foreach my $e ($tree->look_down("class"=>"wsj-headline dj-sg wsj-card-feature heading-3")){
      # say $e->as_text;
      printf FILE "%s\n", $e->as_text;
}
close(FILE);
__DATA__
<html>
<body>
<h1>foo</h1>
<h2>jai</h2>
<h3>kiran</h3>
<h4>jaydeep</h4>
<div><p>hello world</p></div>
<div>foo2</div>
<div>foo3</div>
<div><p>hello again</p></div>
</body>
</html>
