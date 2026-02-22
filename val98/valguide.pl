#!/usr/bin/perl

require "cgi-lib.pl";
require "common.pl";
require "schema.pl";


# Forutsattningarna for att anvanda detta skript har nu forandrats
# Alla fragorna ska finnas med pa en endaste sida. Tidigare var de 133
# fragorna uppdelade pa 4 sidor. Den sista sidan kallas resultat och
# anvander tva viktiga variabler som du maste fylla i nedan, namnligen
# antalet fragor samt partinamnen.

&ReadParse(*in);

if (!%in) {
    &skjema1;
}
elsif ($in{skjema}) {
    &resultat;
}

#elsif ($in{skjema} == 1) {
#    &skjema2;
#}

#elsif ($in{skjema} == 2) {
#    &skjema3;
#}

#elsif ($in{skjema} == 3) {
#   &skjema4; 
#}

#elsif ($in{skjema} == 4) {
#    &resultat;
#}
else {
    print "Content-type: text/html\n\n";
    &error("<font size=+2><p>Hit ska du inte kunna komma!</font>");
}

sub skjema1 {
    print "Content-type: text/html\n\n";
    &print_skjema1;
}

sub skjema2 {
    local($ant_spm)=0;
    print "Content-type: text/html\n\n";
    for ($ant_spm=0; $ant_spm<33; $ant_spm++) {
	if (!$in{'svar'.$ant_spm} || !$in{'diff'.$ant_spm}) {
	    &error("<font size=+2><p>Du har inte fyllt i alla uppgifter.<p>G&aring; tillbaka med back-knappen och fyll i de uppgifter du missat.</font>");
	    exit(0);
	}
	#print "$in{'svar'.$ant_spm} $in{'diff'.$ant_spm}<br>\n";
    }
    &print_skjema2;
}

sub skjema3 {
    local($ant_spm)=0;
    print "Content-type: text/html\n\n";
    for ($ant_spm=33; $ant_spm<66; $ant_spm++) {
	if (!$in{'svar'.$ant_spm} || !$in{'diff'.$ant_spm}) {
	    &error("<font size=+2><p>Du har inte fyllt i alla uppgifter.<p>G&aring; tillbaka med back-knappen och fyll i de uppgifter du missat.</font>");
	    exit(0);
	}
	#print "$in{'svar'.$ant_spm} $in{'diff'.$ant_spm}<br>\n";
    }
    &print_skjema3;
}

sub skjema4 {
    local($ant_spm)=0;
    print "Content-type: text/html\n\n";
    for ($ant_spm=66; $ant_spm<100; $ant_spm++) {
	if (!$in{'svar'.$ant_spm} || !$in{'diff'.$ant_spm}) {
	    &error("<font size=+2><p>Du har inte fyllt i alla uppgifter.<p>G&aring; tillbaka med back-knappen och fyll i de uppgifter du missat.</font>");
	    exit(0);
	}
	#print "$in{'svar'.$ant_spm} $in{'diff'.$ant_spm}<br>\n";
    }
    &print_skjema4;
}

sub resultat {
    local($ant_spm)=0;

    print "Content-type: text/html\n\n";

    # $missing blir en strang av numren pa de fragor som ej ar ifyllda
    $missing = "";
    $num_of_errors = 0;

    # Kolla att alla svaren ar ifyllda i formularet
    for ($ant_spm = 0 ; $ant_spm < $max_antal_fragor; $ant_spm++) 
    {
	if (!$in{'svar'.$ant_spm} || !$in{'diff'.$ant_spm}) 
        {
            $missing = $missing . " " . ($ant_spm +1) . ",";
            $num_of_errors++;
	}
    }
    if($num_of_errors > 0)
    {
        # Tag bort det sista "," ur $missing.
        chop $missing;    
        if($num_of_errors > 1)
        {
            &error("<font size=+2><p>Du har inte fyllt i fullst&auml;ndiga svar p&aring; fr&aring;gorna $missing. G&aring; tillbaka med back-knappen f&ouml;r att fylla i de uppgifter du missat.</font>");
        }
        else
        {
            &error("<font size=+2><p>Du har inte fyllt i fullst&auml;ndigt svar p&aring; fr&aring;ga $missing. G&aring; tillbaka med back-knappen f&ouml;r att fylla i de uppgifter du missat.</font>");
        }
        exit(0);        
    }

    
    # Satt $in{'spm'} till att vara en strang av svar-vikt par.
    #
    # Strangen "112113" innebar da att 3 fragor finns (i vart fall
    # blir det val snarare 40) och svaret pa fraga 1 ar '1' av vikt '1', 
    # pa fraga 2 ar svaret '2' och vikten '1' och pa fraga 3 ar 
    # svaret '1' och vikten '3'.
    #
    for ($ant_spm=0; $ant_spm<$max_antal_fragor; $ant_spm++) 
    {
	$in{'spm'} .= "$in{'svar'.$ant_spm}$in{'diff'.$ant_spm}";
    }

    # Las in partiernas svar
    open (SFIL, "<data.txt") && (@buffer = <SFIL>) && close(SFIL) || do 
    {
	print "Kunde inte oppna data-filen!!!\n";
    };
    
    #
    # For varje parti:
    # Rakna ut differensen mellan anvandarens svar och partiets, multiplicera
    # den med den vikt anvandaren givit fragan och summera over alla fragor.
    #
    # Detta innebar att anvandaren och partiet matchar varandra battre ju lagre
    # differensen blir.
    #
    $lengde = length($in{'spm'});
    for ($i=0; $i<$antal_partier; $i++) 
    {
	$linje = $buffer[$i];
	for ($j=0; $j<$max_antal_fragor; $j++) 
        {
            #
            # $parti{$parti_navn[$i]} = viktad differens for respektive parti
            #
	    $parti{$parti_navn[$i]} += abs((int(substr($linje, $j, 1))-
                                            int(substr($in{'spm'}, $j+$j, 1)))) * 
                                                int(substr($in{'spm'}, $j+$j+1, 1));
	}
        #
        # $sort_parti{total viktad differens} = partiets namn
        # ERROR!!! Fel om flera partier far samma viktade differens
        # Anvand ej $sort_parti!
        #
	# $sort_parti{$parti{$parti_navn[$i]}} = $parti_navn[$i];

        #
        # $tallsort[$i] = parti nr $i:s viktade differens
        #
	$tallsort[$i] = $parti{$parti_navn[$i]};
    }
    #
    # @sorted innehaller alla differenser i vaxande storleksordning,
    # dvs. bast matchning med anvandaren forst, samst matchning sist.
    # Notera att ingen information finns om vilket parti resp. 
    # differens tillhor.
    #    
    @sorted = sort numeri @tallsort;

    #
    # Logga resultatet
    #
    open(LOGFILE, ">>val98.log") || do
    {
        print "Content-type: text/html\n\n";
        print "Kunde inte &ouml;ppna loggfilen!!!\n";
        exit;
    };
    
    # Vi kan bara lata en process i taget logga.
    # flock() laser och laser upp en fil
    flock(LOGFILE, 2);    # 2 ar "exclusive access"
    seek(LOGFILE, 0, 2);
    for ($i=0; $i<$antal_partier; $i++) 
    {
        print LOGFILE $parti{$parti_navn[$i]}, " ";
    }
    print LOGFILE "\n";
    flock(LOGFILE, 8);   # 8 ar "unlock"
    close(LOGFILE);

    # Skicka resultatet till anvandarens browser
    print <<RESULTAT1;
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
	
<HTML>
<HEAD>
<TITLE>Tack f&ouml;r svaret</TITLE>
<base href=http://www-b.svd.se/svd/val_98/images.kompassny.gif>
</HEAD>

<BODY BGCOLOR="#FFFFFF" BACKGROUND="http://www-b.svd.se/svd/logo/background.gif" LINK="#FF0000" VLINK="#808080" TEXT="#000000">

<TABLE BORDER=2 BGCOLOR="#FFFFCC" WIDTH=490 CELLPADDING=8>
<TR><TD><B>SvD:s V&auml;ljarkompass 1998</B> -- Sveriges f&ouml;rsta n&auml;tbaserade valkompass, publicerad av Svenska Dagbladet inf&ouml;r riksdagsvalet den 20 september 1998. De sju riksdagspartier som deltog var Folkpartiet, Milj&ouml;partiet, Kristdemokraterna, Centerpartiet, Moderaterna, Socialdemokraterna och V&auml;nsterpartiet. Utseendet &auml;r autentiskt -- bilder till SvD:s gamla servrar och annonsbanner syns inte l&auml;ngre.</TD></TR>
</TABLE>

  <TABLE WIDTH="514" >
<TR>
<TD align=right COLSPAN=2><A HREF="http://ads.adbannercenter.se/click.ng/site=svd&PagePos=1"><IMG SRC="http://ads.adbannercenter.se/image.ng/site=svd&PagePos=1" HEIGHT=60 WIDTH=468></A></TD>
</TR>

<TR>
<TD align=right width=514 COLSPAN=2><IMG SRC="../../../svd/logo/dot_clear.gif" HEIGHT=26 WIDTH=514></TD>
</TR>

<TR>
<TD width=115 valign=top><IMG SRC="../../../svd/logo/small_head.gif" HEIGHT=60 WIDTH=115></TD>

<TD width=399 valign=top><IMG SRC="../../../svd/logo/huvud.gif" HEIGHT=35 WIDTH=375>

<HR align=left width=375></TD>
</TR>
</TABLE>
  
  <TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=490>
   <TR VALIGN="top" ALIGN="left">
        <TD WIDTH=490 HEIGHT =15><IMG SRC="../assets/auto_generated_images/img_2dd0cc80.gif" WIDTH =625 HEIGHT =1 BORDER=0></TD>
   </TR>
   <TR VALIGN="top" ALIGN="left">
        <TD WIDTH=490 HEIGHT =690>&nbsp;<center><IMG HEIGHT=249 WIDTH=249 SRC=images/kompassny.gif BORDER=0><b><center><FONT SIZE=+2></b></center>
<p>
<br><table border=0 width=490 cellpadding=10><tr><td colspan=2><img src=images/strek.gif border=0></td><tr valign=top><td>
<tr valign=top>
<td>Du f&ouml;refaller <font size=+1 color=#339900>SYMPATISERA</font> med:<BR>Partiet/partierna
 i denna grupp har angivit st&aring;ndpunkter som i h&ouml;g grad sammanfaller med dina. Det/de fick l&auml;gst po&auml;ngsumma och d&auml;rf&ouml;r tycks dina &aring;sikter st&auml;mma b&auml;st med detta/dessa. </td>
<td>
RESULTAT1

    # "Pseudokod" for utskrift av partier och respektive varden
    #
    # For varje differens i @sorted
    #    Om differensen ska skrivas ut i denna sektion
    #       Sok igenom alla partier
    #          Om partiets differens i $parti matchar den sokta differensen
    #             Skriv ut
    #             Satt differensen i $parti sa att den ej hittas igen. Speciellt
    #             viktigt for att inte ett parti ska skrivas ut flera ganger och
    #             ett annat parti inte alls om de har samma differens.
    #
		

    foreach $p (@sorted) 
    {
	if ($p <= $max_antal_fragor*2) 
        {
#	    print "<b>$sort_parti{$p}  ($p)</B><br>\n";
            for($i=0;$i<$antal_partier;$i++)
            {
                if($parti{$parti_navn[$i]} == $p)
                {
                    print "<B>$parti_navn[$i] ($p)</B><BR>\n";
                    $parti{$parti_navn[$i]} = 0;
                }
            }
	}
    }
    
    print <<RESULTAT2;
</td>
</tr>

<tr><td colspan=2><img src=images/strek.gif border=0></td><tr valign=top><td>Du f&ouml;refaller ha <font size=+1 color=#ff9900>MYCKET GEMENSAMT</font> med: <p>Partiet/partierna i den h&auml;r gruppen 
har angivit st&aring;ndpunkter som i ganska stor utstr&auml;ckning st&auml;mmer med dina.
</td>
<td>
RESULTAT2

    foreach $p (@sorted) {
	if ($p <= $max_antal_fragor*3 && $p > $max_antal_fragor*2) {
#	    print "<b>$sort_parti{$p}  ($p)</B><br>\n";
            for($i=0;$i<$antal_partier;$i++)
            {
                if($parti{$parti_navn[$i]} == $p)
                {
                    print "<B>$parti_navn[$i] ($p)</B><BR>\n";
                    $parti{$parti_navn[$i]} = "";
                }
            }            
	}
    }

    print <<RESULTAT3;
</td>
</tr>

<tr><td colspan=2><img src=images/strek.gif border=0></td><tr valign=top><td>Du f&ouml;refaller ha <font size=+1 color=#ff9900>LITE GEMENSAMT</font> med: <p>Partiet/partierna i den h&auml;r gruppen har angivit
st&aring;ndpunkter som bara delvis st&auml;mmer &ouml;verens med dina &aring;sikter. Partiet/partierna som &auml;nd&aring; ligger n&auml;rmast dig &auml;r:</td>
<td>
RESULTAT3
    foreach $p (@sorted) {
	if ($p <= $max_antal_fragor*4 && $p > $max_antal_fragor*3) {
#	    print "<b>$sort_parti{$p}  ($p)</B><br>\n";
            for($i=0;$i<$antal_partier;$i++)
            {
                if($parti{$parti_navn[$i]} == $p)
                {
                    print "<B>$parti_navn[$i] ($p)</B><BR>\n";
                    $parti{$parti_navn[$i]} = "";
                }
            }
	}
    }    

    print <<RESULTAT4;
</td>
</tr>

<tr><td colspan=2><img src=images/strek.gif border=0></td><tr valign=top><td>Du f&ouml;refaller ha <font size=+1 color=#ff0000>INGET GEMENSAMT</font>med: <p>Partiet/partierna i den h&auml;r gruppen har
angivit st&aring;ndpunkter som i h&ouml;g grad g&aring;r p&aring; tv&auml;rs mot dina &aring;sikter. </td>
<td>
RESULTAT4

    foreach $p (@sorted) {
	if ($p > $max_antal_fragor*4) {
#	    print "<b>$sort_parti{$p}  ($p)</B><br>\n";
            for($i=0;$i<$antal_partier;$i++)
            {
                if($parti{$parti_navn[$i]} == $p)
                {
                    print "<B>$parti_navn[$i] ($p)</B><BR>\n";
                    $parti{$parti_navn[$i]} = "";
                }
            }
	}
    } 

    print <<RESULTAT5;
</td>
</tr>

<tr><td colspan=2><img src=images/strek.gif border=0></td>
</table><p><br></b></center> <font size=+1 color=#ff0000></font></font>
<A HREF=\"http://www-b.svd.se/svd/rostning/kompass.html">
<B>Fick du det svar du v&auml;ntade dig? Svara h&auml;r</B></A>

<P>OBS!  Om dina &aring;sikter i h&ouml;g grad korsar de partipolitiska gr&auml;nserna eller om du har<BR>
 mycket starka &aring;sikter om fr&aring;gorna i V&auml;ljarkompassen kan det h&auml;nda att du inte <BR>
 f&aring;r n&aring;gra partier i de tv&aring; f&ouml;rsta grupperna. Om du ser n&auml;rmare p&aring; <BR>
 po&auml;ngsumman inom parentes kan du trots allt se hur du ligger i f&ouml;rh&aring;llande till de <BR>
 olika partierna.  Ju l&auml;gre po&auml;ngsumma desto mer har du gemensamt med det enskilda partiet.<BR>
 Gl&ouml;m inte att V&auml;ljarkompassen inte &auml;r ett facit. Resultatet s&auml;ger t ex inget om <BR>
 dina uppfattningar om olika politikers  kvaliteter. Den tar heller inte h&auml;nsyn till dina <BR>
 &aring;sikter eller taktiska &ouml;verv&auml;ganden om vilka partier som b&ouml;r samarbeta i en <BR>
 regering. <BR>
Vi hoppas att v&auml;ljarkompassen ska ge dig lite v&auml;gledning, men den 20 september <BR>
&auml;r valet ditt och ingen annans.<BR><BR></FONT>
<p>
<CENTER><A HREF=\"http://www-b.svd.se/svd/val_98/index.html"><FONT SIZE="4"><B>&Aring;ter till SvD Val -98</B></A>
</CENTER></TD>

   </TR>
  </TABLE>
</BODY>
</HTML>
RESULTAT5

}

sub error {
    local($string) = @_;
    
    print <<END_ERROR;
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">

<HTML>
<HEAD>
	<TITLE>V&auml;lkommen till SvD:s V&auml;ljarGuide 1998</TITLE>
</HEAD>

<BODY TEXT="#000000" BGCOLOR="#FFFFFF" LINK="#004080" VLINK="#818181" ALINK="#008080">

<P><A HREF=\"http://ads.adbannercenter.se/click.ng/site=svd&PagePos=1\"><IMG SRC=\"http://ads.adbannercenter.se/image.ng/site=svd&PagePos=1\" WIDTH=468 HEIGHT=60 BORDER=2></A></P>
END_ERROR
    
    print "$string";
    
    print <<END_ERROR2;
<P><HR WIDTH=489 ALIGN=LEFT></P>
<P><FONT SIZE=-1>&copy; 1998 SvD <A HREF=\"mailto:webmaster\@svd.se\">webmaster\@svd.se</A></FONT></P>
</BODY>
</HTML>
END_ERROR2

}

