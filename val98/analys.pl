#!/usr/bin/perl

require "common.pl";

# @parti_bild maste innehalla $antal_partier bildreferenser
@parti_bild = (

               "http://www-b.svd.se/svd/val_98/images/fpkompass.gif",
               "http://www-b.svd.se/svd/val_98/images/mpkompass.gif",
               "http://www-b.svd.se/svd/val_98/images/kdkompass.gif",
               "http://www-b.svd.se/svd/val_98/images/ckompass.gif",
               "http://www-b.svd.se/svd/val_98/images/mkompass.gif",
               "http://www-b.svd.se/svd/val_98/images/skompass.gif",
               "http://www-b.svd.se/svd/val_98/images/vkompass.gif",
               
               );
#Antalet klasser. En klass ar en grupp pa svarssidan.
$antal_parti_klasser = 4;

# Initialisera alla varden
for($i=0;$i<$antal_partier;$i++)
{
    $parti_sum[$i] = 0;
    $parti_procent[$i] = 0;
    $parti[$i] = 0;
    #$parti_klass_ordning[$i] = 0;
    #for($j=0;$j<$antal_parti_klasser;$j++)
    #{
    #    $parti_klass[$i][$j] = 0;
    #}
}
$totalsumma = 0;

# Oppna loggfilen
open (LFIL, "<val98.log") || do
{
    print "Content-type: text/html\n\n";
    print "Kunde inte oppna data-filen!!!\n";
    exit;
};

# For varje rad i loggfilen, addera vardet till resp partis slutsumma
# $num_of_users ar det antal anvandare som rostat (=antal rader i loggfilen)
$num_of_users=0;
while($rad=<LFIL>)
{
    $num_of_users++;
    chop($rad);

    # Denna rad maste justeras enligt $antal_partier,
    # dvs. det maste finnas lika manga "(\S+)" nedan som det finns partier.
    (@parti) = $rad =~ /^(\S+) (\S+) (\S+) (\S+) (\S+) (\S+) (\S+)/;

    for($i=0;$i<$antal_partier;$i++)
    {
        $parti_sum[$i] += $parti[$i];
        
        #Kontrollera vilken klass svaret rackte till
        #if($parti[$i] <= $max_antal_fragor*2)
        #{
            #Vardet rackte till klass 1 ("Du har mycket gemensamt med...").
            # Oka antalet "hittar" i denna klass med 1
        #    $parti_klass[$i][0] += 1;
        #}
        
        #if($parti[$i] <= $max_antal_fragor*3 && $parti[$i] > $max_antal_fragor*2)
        #{
        #    $parti_klass[$i][1] += 1;
        #}

        #if($parti[$i] <= $max_antal_fragor*4 && $parti[$i] > $max_antal_fragor*3)
        #{
        #    $parti_klass[$i][2] += 1;
        #}
        #if($parti[$i] > $max_antal_fragor*4)
        #{
        #    $parti_klass[$i][3] += 1;
        #}

    }
}

# Eftersom lagre totalsumma indikerar fler valjare 
# maste varje varde inverteras. 
# Totalsumman maste da baseras pa de inverterade vardena.
for($i=0;$i<$antal_partier;$i++)
{
    if($parti_sum[$i] != 0)
    {
        $totalsumma += 1/$parti_sum[$i];
    }
}

# Berakna respektive partis procentandel
for($i=0;$i<$antal_partier;$i++)
{
    if(($parti_sum[$i] != 0) && ($totalsumma != 0))
    {
        $parti_procent[$i] = ((1/$parti_sum[$i])/$totalsumma)*100;
    }
    else
    {
        $parti_procent[$i] = 0;
    }
}

# Sortera procentandelarna i fallande ordning.
@parti_procent_sorterad = sort reversed @parti_procent;

print "Content-type: text/html\n\n";
print <<END_ANALYS_1;
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">

<HTML>
<HEAD>
	<TITLE>Partitoppen</TITLE>
</HEAD>

<BODY TEXT="#000000" BGCOLOR="#FFFFFF"  BACKGROUND="http://www-b.svd.se/svd/logo/background.gif" LINK="#004080" VLINK="#818181" ALINK="#008080">

<TABLE BORDER=2 BGCOLOR="#FFFFCC" WIDTH=490 CELLPADDING=8>
<TR><TD><B>SvD:s V&auml;ljarkompass 1998</B> -- Sveriges f&ouml;rsta n&auml;tbaserade valkompass, publicerad av Svenska Dagbladet inf&ouml;r riksdagsvalet den 20 september 1998. De sju riksdagspartier som deltog var Folkpartiet, Milj&ouml;partiet, Kristdemokraterna, Centerpartiet, Moderaterna, Socialdemokraterna och V&auml;nsterpartiet. Utseendet &auml;r autentiskt -- bilder till SvD:s gamla servrar och annonsbanner syns inte l&auml;ngre.</TD></TR>
</TABLE>

<TABLE WIDTH=514>
<TR><TD ALIGN=RIGHT COLSPAN=2><A HREF=\"http://ads.adbannercenter.se/click.ng/site=svd&PagePos=1"><IMG SRC="http://ads.adbannercenter.se/image.ng/site=svd&PagePos=1" WIDTH=468 HEIGHT=60 BORDER=2></A></TD></TR>
<TR><TD ALIGN=RIGHT WIDTH=514 COLSPAN=2><IMG SRC="http://www-b.svd.se/svd/logo/dot_clear.gif" WIDTH=514 HEIGHT=26></TD></TR>
<TR><TD WIDTH=115 VALIGN=TOP><IMG SRC="http://www-b.svd.se/svd/logo/small_head.gif" ALT="SvD" WIDTH=115 HEIGHT=60 BORDER=0></TD>
<TD WIDTH=399 VALIGN=TOP><IMG SRC="http://www.svd.se/svd/logo/huvud.gif" ALT=\"Svenska Dagbladet\" WIDTH=375 HEIGHT=35 BORDER=0>
<HR ALIGN=LEFT WIDTH=395></TD></TR>
</TABLE>


<table><TABLE WIDTH=300><tr>
<TD ALIGN=LEFT VALIGN=TOP WIDTH="375">
<H2>
Partitoppen<BR> - s&aring; f&ouml;rdelas sympatierna</H2>
</TD>
</TR>

<td align="LEFT">

Staplarna visar i procent hur v&auml;l partiernas st&aring;ndpunkter st&auml;mmer med de &aring;sikter som V&auml;ljarkompassens 
anv&auml;ndare har klickat f&ouml;r. Partiet med l&auml;ngst stapel har allts&aring; angivit st&aring;ndpunkter som 
i st&ouml;rst utstr&auml;ckning gillas av de personer som hittills gjort testet.<BR>
 P&aring; svarssidan f&aring;r varje v&auml;ljare en summa f&ouml;r varje parti. Summan &auml;r l&auml;gre ju n&auml;rmare
v&auml;ljarens &aring;sikter ligger respektive partis st&aring;ndpunkter. Samtliga sju slutsummor fr&aring;n alla som gjort testet summeras. Partiet med l&auml;gst totalsumma f&aring;r den l&auml;ngsta stapeln.
END_ANALYS_1

if($num_of_users > 10)
{
    print("<P>Antalet tester hittills i V&auml;ljarkompassen:<B> $num_of_users ");</B>
  
}

print("<P><CENTER><A HREF=\"http://www-b.svd.se/svd/val_98/index.html\"><FONT SIZE=\"4\"><B>&Aring;ter till SvD Val -98</B></A>");
print("</CENTER></TD>");

print("</TABLE><table><tr><td align=\"center\">\n");

$klass_ordnings_index=0;

foreach $p (@parti_procent_sorterad)
{
    for($i=0;$i<$antal_partier;$i++)
    {
        if($parti_procent[$i] == $p)
        {
            print("<tr>\n");
            print("<td><font size=-1 face=\"Verdana, Geneva, Arial, Helvetica\"><B>$parti_navn[$i]&nbsp;</font></td>\n");
            print("<td align=right><font size=-1 face=\"Verdana, Geneva, Arial, Helvetica\">\n");
    
            printf("%.2f", $p);

            print("</font></td>\n");
            print("<td><img src=\"$parti_bild[$i]\" width=");
          
            # Skala vardet sa att det blir grafiskt tilltalande
            printf("%.2f", $p*10);

            print(" height=\'5\' border=1></td>");
            print("</tr>\n");

            # Se till att detta parti ej hittas igen
            $parti_procent[$i] = -1;
            
            # Genom att spara undan $i i $parti_klass_ordning vet vi i vilken
            # ordning partierna ska visas i partiklasstabellen.
            #$parti_klass_ordning[$klass_ordnings_index] = $i;
            #$klass_ordnings_index++;
        }
    }
}

print("</TABLE>\n");
print("<P>\n");

# Skriv ut hur respektive parti placerat sig i de olika klasserna.
# Det procentuellt sett storsta partiet forst.
#
# OBS! Om denna tabell ej ska visas, kommentera da bort varje rad mellan 
# "#++++..."-markeringarna genom att skriva in ett # forst pa varje rad
#
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# print("Procent av anv&auml;ndarna som f&aring;tt partiet i grupp 1, 2, 3 resp. 4:\n");
# print("<P>\n");
# print("<TABLE BORDER>\n");
# print("<TR>\n");
# print("<TD></TD>\n");
# print("<TD ALIGN=center><B><font size=-1 face=\"Verdana, Geneva, Arial, Helvetica\">1</FONT></TD>\n");
# print("<TD ALIGN=center><B><font size=-1 face=\"Verdana, Geneva, Arial, Helvetica\">2</FONT></TD>\n");
# print("<TD ALIGN=center><B><font size=-1 face=\"Verdana, Geneva, Arial, Helvetica\">3</FONT></TD>\n");
# print("<TD ALIGN=center><B><font size=-1 face=\"Verdana, Geneva, Arial, Helvetica\">4</FONT></TD>\n");
# print("</TR>\n");
# for($i=0;$i<$antal_partier;$i++)
# {
#     $aktuellt_parti = $parti_klass_ordning[$i];
#     print("<TR>\n");
#     print("<TD><B><font size=-1 face=\"Verdana, Geneva, Arial, Helvetica\">$parti_navn[$aktuellt_parti]</FONT></TD>\n");
#     print("");
#     printf("<TD ALIGN=RIGHT>%.2f%%</TD>", ($parti_klass[$aktuellt_parti][0]/$num_of_users)*100);    
#     printf("<TD ALIGN=RIGHT>%.2f%%</TD>", ($parti_klass[$aktuellt_parti][1]/$num_of_users)*100);    
#     printf("<TD ALIGN=RIGHT>%.2f%%</TD>", ($parti_klass[$aktuellt_parti][2]/$num_of_users)*100);    
#     printf("<TD ALIGN=RIGHT>%.2f%%</TD>", ($parti_klass[$aktuellt_parti][3]/$num_of_users)*100);
#     print("</TR>\n");
# }
#print("</TABLE>\n");
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

print("</BODY></HTML>\n");

