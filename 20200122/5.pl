my $a=0;
my $b=0;
my $c=0;
my $sum=0;

while($a<=30)
{
	while($b<=40)
	{
		while($c<=40)
		{
			my $tmp = $a*205 + $b*82 + $c*30;
			print $tmp . "\n";
			$c++;
		}
		$b++;
		$c=0;
	}
	$b=0;
	$a++;
}
