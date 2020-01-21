my $a = 1234567890;
my $i = 1;
my $sum = 0;

while($i<=5000000)
{
	if($a % $i == 0)
	{
		$sum += $i;
	}
	$i++;
}
print $sum;
