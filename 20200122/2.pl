my $a=1;
my $b=0;
my $c=5;

my $cnt=3;

while($cnt<31)
{
	$cnt++;
	my $tmp = $a + $b + $c;
	$a = $b;
	$b = $c;
	$c = $tmp;
}
print $c;
