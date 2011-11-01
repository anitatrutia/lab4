use warnings;
use strict;
use Data::Dumper;
my $linie; 
my @string;
my $tablou = [];
open(FILE,"situatie-1.txt") or die $!;
while ($linie = <FILE>)
{
	if(index($linie, "<li>") == 0)
	{
		my @sg1;
		@sg1 = split("<li>", $linie );
		
		if(index($sg1[1], " -- ") > -1)
		{
			my @sg2 ;
			my $nume;
			my $prenume;
			
			@sg2 = split(" -- ",$sg1[1]);
			$nume = substr($sg2[0],0,index($sg2[0]," "));
			$prenume = substr($sg2[0],index($sg2[0]," "));
			$prenume =~ s/-/ /g;
			$prenume =~ s/\b(\w)/\U$1/g;
                        @string = (uc($nume),$prenume,$sg2[1]);

			
		}
		elsif(index($sg1[1]," - ") > -1)
		{
			my @sg2;
			my $nume;
			my $prenume;
			my $nota;

                        @sg2 = split(" - ",$sg1[1]);
                        $nume = substr($sg2[0],0,index($sg2[0]," "));
                        $prenume = substr($sg2[0],index($sg2[0]," "));
                        $prenume =~ s/-/ /g;
                        $prenume =~ s/\b(\w)/\U$1/g;
			$nota = substr($sg2[1],0,-6);
                        @string = (uc($nume), $prenume, $nota,"\n");

	}
	}
                       push (@{$tablou},{'nume'=>$string[0],
                                       'prenume'=>$string[1],
                                       'nota'=>$string[2]
                                 });    
	
}

print Dumper($tablou);
close(FILE);

