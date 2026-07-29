#!/usr/local/bin/perl


sub print_skjema1 {

    print <<END_SKJEMA1;
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">

<HTML>
<HEAD>
	<TITLE>V&auml;lkommen till SvD:s V&auml;ljarkompass 1998</TITLE>
</HEAD>

<BODY TEXT="#000000" BGCOLOR="#FFFFFF" LINK="#004080" VLINK="#818181" ALINK="#008080">

<TABLE BORDER=2 BGCOLOR="#FFFFCC" WIDTH=514 CELLPADDING=8>
<TR><TD><B>SvD:s V&auml;ljarkompass 1998</B> -- Sveriges f&ouml;rsta valkompass.</TD></TR>
</TABLE>

<TABLE WIDTH=514>
<TR><TD ALIGN=RIGHT COLSPAN=2><IMG SRC="/val98/images/moller.gif" WIDTH=468 HEIGHT=60 BORDER=0></TD></TR>
<TR><TD ALIGN=RIGHT WIDTH=514 COLSPAN=2><IMG SRC="/val98/images/dot_clear.gif" WIDTH=514 HEIGHT=26></TD></TR>
<TR><TD WIDTH=115 VALIGN=TOP><IMG SRC="/val98/images/small_head.gif" ALT="SvD" WIDTH=115 HEIGHT=60 BORDER=0></TD>
<TD WIDTH=399 VALIGN=TOP><IMG SRC="/val98/images/huvud.gif" ALT=\"Svenska Dagbladet\" WIDTH=375 HEIGHT=35 BORDER=0>
<HR ALIGN=LEFT WIDTH=395></TD></TR>
</TABLE>


<TABLE CELLSPACING=0 BORDER=0 WIDTH=500>
<TD valign=top align=LEFT width=500>
<H2>Hitta r&auml;tt parti med V&auml;ljarkompassen</H2>
</TD>
</TR>
<tr><td>
<br>
<img src=/val98/images/kompassny.gif HEIGHT=140 WIDTH=146 border=0 ALIGN=RIGHT>

V&auml;ljarkompassen hj&auml;lper dig sortera partierna inf&ouml;r valet den 20 september. Du tar st&auml;llning

till ett antal p&aring;st&aring;enden. Dina svar j&auml;mf&ouml;rs med de sju riksdagspartiernas st&aring;ndpunkter 
(ja, vi har st&auml;llt samma fr&aring;gor till dem) och p&aring; svarssidan
f&aring;r du besked om hur dina &aring;sikter f&ouml;rh&aring;ller sig till partiernas. Naturligtvis &auml;r dina svar
hemliga och kan inte sp&aring;ras till dig.
En mer detaljerad beskrivning av hur V&auml;ljarkompassen
fungerar <A HREF="/kompassforklar.html">hittar du h&auml;r</A>
<P>
<B>1. F&ouml;rst m&aring;ste du kryssa f&ouml;r hur enig eller oenig du &auml;r med  p&aring;st&aring;endet.<p>
2. D&auml;refter anger du hur viktig denna fr&aring;ga &auml;r f&ouml;r dig.<p>
</B>Om du inte kryssar f&ouml;r b&aring;da kolumnerna p&aring; varje fr&aring;ga f&aring;r du ett felmeddelande.</font>
</td></tr>
</table>
<!-- Modern testhj&auml;lp, inte del av originalsidan fr&aring;n 1998 -->
<p><button type="button" onclick="fuskaMedSlumpadeSvar()">&#127922; Slumpa alla svar (testfusk tillagt 2026, fanns inte i originalet fr&aring;n 1998)</button></p>
<script>
// Partiernas exakta svar, samma data som val98/data.txt (&auml;ndras inte l&auml;ngre)
var partiSvar = [
    "244455543151151441511525512115555",
    "242521114514531151551554555115315",
    "142451425141143141422524411515555",
    "442541425142121151421545532115524",
    "324355355151154513414135511514552",
    "344533111135111151511524545115514",
    "152511111515541151551542555155215"
];
function fuskaMedSlumpadeSvar() {
    var form = document.forms[0];
    var parti = partiSvar[Math.floor(Math.random() * partiSvar.length)];
    for (var j = 0; j < parti.length; j++) {
        form.elements['svar' + j].value = parti.charAt(j);
        form.elements['diff' + j].value = String(Math.floor(Math.random() * 4) + 1);
    }
}
</script>

<form method="post" action="/cgi-bin/val98/valguide.pl">
<input type=hidden name=skjema value=1>
<TABLE CELLSPACING=0 BORDER=1 WIDTH=626>
<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>1</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Sunda statsfinanser &auml;r viktigare &auml;n s&auml;nkt arbetsl&ouml;shet p&aring; kort sikt</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar0 value=5>
</td><td width=10%><input type=radio name=svar0 value=4>
</td><td width=10%><input type=radio name=svar0 value=3>
</td><td width=10%><input type=radio name=svar0 value=2>
</td><td width=10%><input type=radio name=svar0 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff0 value=4>
</td><td width=10%><input type=radio name=diff0 value=3>
</td><td width=10%><input type=radio name=diff0 value=2>
</td> <td width=10%><input type=radio name=diff0 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>2</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P> Mer pengar &auml;r b&auml;sta s&auml;ttet att l&ouml;sa krisen i v&aring;rden</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar1 value=5>
</td><td width=10%><input type=radio name=svar1 value=4>
</td><td width=10%><input type=radio name=svar1 value=3>
</td><td width=10%><input type=radio name=svar1 value=2>
</td><td width=10%><input type=radio name=svar1 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff1 value=4>
</td><td width=10%><input type=radio name=diff1 value=3>
</td><td width=10%><input type=radio name=diff1 value=2>
</td> <td width=10%><input type=radio name=diff1 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>3</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>B&auml;ttre organisation, inte pengar, &auml;r vad v&aring;rden beh&ouml;ver</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar2 value=5>
</td><td width=10%><input type=radio name=svar2 value=4>
</td><td width=10%><input type=radio name=svar2 value=3>
</td><td width=10%><input type=radio name=svar2 value=2>
</td><td width=10%><input type=radio name=svar2 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff2 value=4>
</td><td width=10%><input type=radio name=diff2 value=3>
</td><td width=10%><input type=radio name=diff2 value=2>
</td> <td width=10%><input type=radio name=diff2 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>4</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Kommunerna b&ouml;r f&aring; mer pengar</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar3 value=5>
</td><td width=10%><input type=radio name=svar3 value=4>
</td><td width=10%><input type=radio name=svar3 value=3>
</td><td width=10%><input type=radio name=svar3 value=2>
</td><td width=10%><input type=radio name=svar3 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff3 value=4>
</td><td width=10%><input type=radio name=diff3 value=3>
</td><td width=10%><input type=radio name=diff3 value=2>
</td> <td width=10%><input type=radio name=diff3 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>5</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Den privata &auml;gander&auml;tten b&ouml;r st&auml;rkas</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar4 value=5>
</td><td width=10%><input type=radio name=svar4 value=4>
</td><td width=10%><input type=radio name=svar4 value=3>
</td><td width=10%><input type=radio name=svar4 value=2>
</td><td width=10%><input type=radio name=svar4 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff4 value=4>
</td><td width=10%><input type=radio name=diff4 value=3>
</td><td width=10%><input type=radio name=diff4 value=2>
</td> <td width=10%><input type=radio name=diff4 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>6</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Sverige b&ouml;r s&aring; snart som m&ouml;jligt g&aring; med i EMU (den europeiska ekonomiska och monet&auml;ra unionen)</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar5 value=5>
</td><td width=10%><input type=radio name=svar5 value=4>
</td><td width=10%><input type=radio name=svar5 value=3>
</td><td width=10%><input type=radio name=svar5 value=2>
</td><td width=10%><input type=radio name=svar5 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff5 value=4>
</td><td width=10%><input type=radio name=diff5 value=3>
</td><td width=10%><input type=radio name=diff5 value=2>
</td> <td width=10%><input type=radio name=diff5 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>7</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Arbetsr&auml;tten b&ouml;r &auml;ndras till f&ouml;retagarnas f&ouml;rdel</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar6 value=5>
</td><td width=10%><input type=radio name=svar6 value=4>
</td><td width=10%><input type=radio name=svar6 value=3>
</td><td width=10%><input type=radio name=svar6 value=2>
</td><td width=10%><input type=radio name=svar6 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff6 value=4>
</td><td width=10%><input type=radio name=diff6 value=3>
</td><td width=10%><input type=radio name=diff6 value=2>
</td> <td width=10%><input type=radio name=diff6 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>8</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Betyg b&ouml;r ges redan i &aring;rskurs 4 (i dag fr&aring;n &aring;rskurs 8)
</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar7 value=5>
</td><td width=10%><input type=radio name=svar7 value=4>
</td><td width=10%><input type=radio name=svar7 value=3>
</td><td width=10%><input type=radio name=svar7 value=2>
</td><td width=10%><input type=radio name=svar7 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff7 value=4>
</td><td width=10%><input type=radio name=diff7 value=3>
</td><td width=10%><input type=radio name=diff7 value=2>
</td> <td width=10%><input type=radio name=diff7 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>9</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>F&ouml;r&auml;ldrar som vill stanna hemma med barnen b&ouml;r f&aring; v&aring;rdnadsbidrag</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar8 value=5>
</td><td width=10%><input type=radio name=svar8 value=4>
</td><td width=10%><input type=radio name=svar8 value=3>
</td><td width=10%><input type=radio name=svar8 value=2>
</td><td width=10%><input type=radio name=svar8 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff8 value=4>
</td><td width=10%><input type=radio name=diff8 value=3>
</td><td width=10%><input type=radio name=diff8 value=2>
</td> <td width=10%><input type=radio name=diff8 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>10</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Inkomster &ouml;ver 30 000 kr i m&aring;naden b&ouml;r beskattas h&aring;rdare &auml;n i dag (marginalskatten &auml;r i dag ca 56 procent)</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar9 value=5>
</td><td width=10%><input type=radio name=svar9 value=4>
</td><td width=10%><input type=radio name=svar9 value=3>
</td><td width=10%><input type=radio name=svar9 value=2>
</td><td width=10%><input type=radio name=svar9 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff9 value=4>
</td><td width=10%><input type=radio name=diff9 value=3>
</td><td width=10%><input type=radio name=diff9 value=2>
</td> <td width=10%><input type=radio name=diff9 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>11</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Alla b&ouml;r f&aring; skattes&auml;nkningar</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar10 value=5>
</td><td width=10%><input type=radio name=svar10 value=4>
</td><td width=10%><input type=radio name=svar10 value=3>
</td><td width=10%><input type=radio name=svar10 value=2>
</td><td width=10%><input type=radio name=svar10 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff10 value=4>
</td><td width=10%><input type=radio name=diff10 value=3>
</td><td width=10%><input type=radio name=diff10 value=2>
</td> <td width=10%><input type=radio name=diff10 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>12</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Dagens skattetryck &auml;r n&ouml;dv&auml;ndigt f&ouml;r att bevara v&auml;lf&auml;rden</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar11 value=5>
</td><td width=10%><input type=radio name=svar11 value=4>
</td><td width=10%><input type=radio name=svar11 value=3>
</td><td width=10%><input type=radio name=svar11 value=2>
</td><td width=10%><input type=radio name=svar11 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff11 value=4>
</td><td width=10%><input type=radio name=diff11 value=3>
</td><td width=10%><input type=radio name=diff11 value=2>
</td> <td width=10%><input type=radio name=diff11 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>13</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Sverige b&ouml;r l&auml;mna EU</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar12 value=5>
</td><td width=10%><input type=radio name=svar12 value=4>
</td><td width=10%><input type=radio name=svar12 value=3>
</td><td width=10%><input type=radio name=svar12 value=2>
</td><td width=10%><input type=radio name=svar12 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff12 value=4>
</td><td width=10%><input type=radio name=diff12 value=3>
</td><td width=10%><input type=radio name=diff12 value=2>
</td> <td width=10%><input type=radio name=diff12 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>14</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Det beh&ouml;vs betydligt fler poliser f&ouml;r att uppr&auml;tth&aring;lla lag och ordning</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar13 value=5>
</td><td width=10%><input type=radio name=svar13 value=4>
</td><td width=10%><input type=radio name=svar13 value=3>
</td><td width=10%><input type=radio name=svar13 value=2>
</td><td width=10%><input type=radio name=svar13 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff13 value=4>
</td><td width=10%><input type=radio name=diff13 value=3>
</td><td width=10%><input type=radio name=diff13 value=2>
</td> <td width=10%><input type=radio name=diff13 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>15</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>F&ouml;rsvaret b&ouml;r f&aring; mer pengar (i dag f&aring;r f&ouml;rsvaret ca 40 miljarder kr per &aring;r)</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar14 value=5>
</td><td width=10%><input type=radio name=svar14 value=4>
</td><td width=10%><input type=radio name=svar14 value=3>
</td><td width=10%><input type=radio name=svar14 value=2>
</td><td width=10%><input type=radio name=svar14 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff14 value=4>
</td><td width=10%><input type=radio name=diff14 value=3>
</td><td width=10%><input type=radio name=diff14 value=2>
</td> <td width=10%><input type=radio name=diff14 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>16</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>K&auml;rnkraften b&ouml;r  vara kvar p&aring; dagens niv&aring; 	</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar15 value=5>
</td><td width=10%><input type=radio name=svar15 value=4>
</td><td width=10%><input type=radio name=svar15 value=3>
</td><td width=10%><input type=radio name=svar15 value=2>
</td><td width=10%><input type=radio name=svar15 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff15 value=4>
</td><td width=10%><input type=radio name=diff15 value=3>
</td><td width=10%><input type=radio name=diff15 value=2>
</td> <td width=10%><input type=radio name=diff15 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>17</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>K&auml;rnkraften b&ouml;r avvecklas</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar16 value=5>
</td><td width=10%><input type=radio name=svar16 value=4>
</td><td width=10%><input type=radio name=svar16 value=3>
</td><td width=10%><input type=radio name=svar16 value=2>
</td><td width=10%><input type=radio name=svar16 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff16 value=4>
</td><td width=10%><input type=radio name=diff16 value=3>
</td><td width=10%><input type=radio name=diff16 value=2>
</td> <td width=10%><input type=radio name=diff16 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>18</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Invandringsreglerna b&ouml;r bli str&auml;ngare</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar17 value=5>
</td><td width=10%><input type=radio name=svar17 value=4>
</td><td width=10%><input type=radio name=svar17 value=3>
</td><td width=10%><input type=radio name=svar17 value=2>
</td><td width=10%><input type=radio name=svar17 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff17 value=4>
</td><td width=10%><input type=radio name=diff17 value=3>
</td><td width=10%><input type=radio name=diff17 value=2>
</td> <td width=10%><input type=radio name=diff17 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>19</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Invandringen har varit till f&ouml;rdel f&ouml;r Sverige</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar18 value=5>
</td><td width=10%><input type=radio name=svar18 value=4>
</td><td width=10%><input type=radio name=svar18 value=3>
</td><td width=10%><input type=radio name=svar18 value=2>
</td><td width=10%><input type=radio name=svar18 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff18 value=4>
</td><td width=10%><input type=radio name=diff18 value=3>
</td><td width=10%><input type=radio name=diff18 value=2>
</td> <td width=10%><input type=radio name=diff18 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>20</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Minskad arbetstid &auml;r en bra v&auml;g f&ouml;r att fler skall f&aring; jobb</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar19 value=5>
</td><td width=10%><input type=radio name=svar19 value=4>
</td><td width=10%><input type=radio name=svar19 value=3>
</td><td width=10%><input type=radio name=svar19 value=2>
</td><td width=10%><input type=radio name=svar19 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff19 value=4>
</td><td width=10%><input type=radio name=diff19 value=3>
</td><td width=10%><input type=radio name=diff19 value=2>
</td> <td width=10%><input type=radio name=diff19 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>21</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Alkoholpolitiken b&ouml;r liberaliseras</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar20 value=5>
</td><td width=10%><input type=radio name=svar20 value=4>
</td><td width=10%><input type=radio name=svar20 value=3>
</td><td width=10%><input type=radio name=svar20 value=2>
</td><td width=10%><input type=radio name=svar20 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff20 value=4>
</td><td width=10%><input type=radio name=diff20 value=3>
</td><td width=10%><input type=radio name=diff20 value=2>
</td> <td width=10%><input type=radio name=diff20 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>22</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Systembolagets f&ouml;rs&auml;ljningsmonopol skall vara kvar</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar21 value=5>
</td><td width=10%><input type=radio name=svar21 value=4>
</td><td width=10%><input type=radio name=svar21 value=3>
</td><td width=10%><input type=radio name=svar21 value=2>
</td><td width=10%><input type=radio name=svar21 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff21 value=4>
</td><td width=10%><input type=radio name=diff21 value=3>
</td><td width=10%><input type=radio name=diff21 value=2>
</td> <td width=10%><input type=radio name=diff21 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>23</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Det b&ouml;r anordnas fler folkomr&ouml;stningar i Sverige</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar22 value=5>
</td><td width=10%><input type=radio name=svar22 value=4>
</td><td width=10%><input type=radio name=svar22 value=3>
</td><td width=10%><input type=radio name=svar22 value=2>
</td><td width=10%><input type=radio name=svar22 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff22 value=4>
</td><td width=10%><input type=radio name=diff22 value=3>
</td><td width=10%><input type=radio name=diff22 value=2>
</td> <td width=10%><input type=radio name=diff22 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>24</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Ett &ouml;kat inslag av personval st&auml;rker demokratin</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar23 value=5>
</td><td width=10%><input type=radio name=svar23 value=4>
</td><td width=10%><input type=radio name=svar23 value=3>
</td><td width=10%><input type=radio name=svar23 value=2>
</td><td width=10%><input type=radio name=svar23 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff23 value=4>
</td><td width=10%><input type=radio name=diff23 value=3>
</td><td width=10%><input type=radio name=diff23 value=2>
</td> <td width=10%><input type=radio name=diff23 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>25</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Kvinnan skall ensam best&auml;mma om abort</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar24 value=5>
</td><td width=10%><input type=radio name=svar24 value=4>
</td><td width=10%><input type=radio name=svar24 value=3>
</td><td width=10%><input type=radio name=svar24 value=2>
</td><td width=10%><input type=radio name=svar24 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff24 value=4>
</td><td width=10%><input type=radio name=diff24 value=3>
</td><td width=10%><input type=radio name=diff24 value=2>
</td> <td width=10%><input type=radio name=diff24 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>26</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Homosexuella par b&ouml;r kunna adoptera barn</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar25 value=5>
</td><td width=10%><input type=radio name=svar25 value=4>
</td><td width=10%><input type=radio name=svar25 value=3>
</td><td width=10%><input type=radio name=svar25 value=2>
</td><td width=10%><input type=radio name=svar25 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff25 value=4>
</td><td width=10%><input type=radio name=diff25 value=3>
</td><td width=10%><input type=radio name=diff25 value=2>
</td> <td width=10%><input type=radio name=diff25 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>27</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Kvotering &auml;r en bra metod f&ouml;r att &ouml;ka j&auml;mst&auml;lldheten	</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar26 value=5>
</td><td width=10%><input type=radio name=svar26 value=4>
</td><td width=10%><input type=radio name=svar26 value=3>
</td><td width=10%><input type=radio name=svar26 value=2>
</td><td width=10%><input type=radio name=svar26 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff26 value=4>
</td><td width=10%><input type=radio name=diff26 value=3>
</td><td width=10%><input type=radio name=diff26 value=2>
</td> <td width=10%><input type=radio name=diff26 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>28</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Ytterligare en karensdag b&ouml;r inf&ouml;ras i sjukf&ouml;rs&auml;kringen</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar27 value=5>
</td><td width=10%><input type=radio name=svar27 value=4>
</td><td width=10%><input type=radio name=svar27 value=3>
</td><td width=10%><input type=radio name=svar27 value=2>
</td><td width=10%><input type=radio name=svar27 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff27 value=4>
</td><td width=10%><input type=radio name=diff27 value=3>
</td><td width=10%><input type=radio name=diff27 value=2>
</td> <td width=10%><input type=radio name=diff27 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>29</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Karensdagen i sjukf&ouml;rs&auml;kringen b&ouml;r slopas</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar28 value=5>
</td><td width=10%><input type=radio name=svar28 value=4>
</td><td width=10%><input type=radio name=svar28 value=3>
</td><td width=10%><input type=radio name=svar28 value=2>
</td><td width=10%><input type=radio name=svar28 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff28 value=4>
</td><td width=10%><input type=radio name=diff28 value=3>
</td><td width=10%><input type=radio name=diff28 value=2>
</td> <td width=10%><input type=radio name=diff28 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>30</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>De s&auml;mst  st&auml;llda pension&auml;rerna b&ouml;r f&aring; h&ouml;jda pensioner</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar29 value=5>
</td><td width=10%><input type=radio name=svar29 value=4>
</td><td width=10%><input type=radio name=svar29 value=3>
</td><td width=10%><input type=radio name=svar29 value=2>
</td><td width=10%><input type=radio name=svar29 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff29 value=4>
</td><td width=10%><input type=radio name=diff29 value=3>
</td><td width=10%><input type=radio name=diff29 value=2>
</td> <td width=10%><input type=radio name=diff29 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>31</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Det &auml;r bra att vi sj&auml;lv ska f&aring; styra placeringen av en del av v&aring;r pensionspengar
</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar30 value=5>
</td><td width=10%><input type=radio name=svar30 value=4>
</td><td width=10%><input type=radio name=svar30 value=3>
</td><td width=10%><input type=radio name=svar30 value=2>
</td><td width=10%><input type=radio name=svar30 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff30 value=4>
</td><td width=10%><input type=radio name=diff30 value=3>
</td><td width=10%><input type=radio name=diff30 value=2>
</td> <td width=10%><input type=radio name=diff30 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>32</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Skatterabatt f&ouml;r privata hush&aring;llstj&auml;nster b&ouml;r inf&ouml;ras
</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar31 value=5>
</td><td width=10%><input type=radio name=svar31 value=4>
</td><td width=10%><input type=radio name=svar31 value=3>
</td><td width=10%><input type=radio name=svar31 value=2>
</td><td width=10%><input type=radio name=svar31 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff31 value=4>
</td><td width=10%><input type=radio name=diff31 value=3>
</td><td width=10%><input type=radio name=diff31 value=2>
</td> <td width=10%><input type=radio name=diff31 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

<TR><TD WIDTH=4% VALIGN=TOP>
<B><P>33</B></TD>
<TD WIDTH=96% VALIGN=TOP colspan=10>
<P>Sveriges u-landsbist&aring;nd b&ouml;r snabbt &aring;terst&auml;llas till 1 procent
 av bruttonationalinkomsten (i dag 0,7 procent)</td></tr>
<tr>
<td></td>
<td width=10%><input type=radio name=svar32 value=5>
</td><td width=10%><input type=radio name=svar32 value=4>
</td><td width=10%><input type=radio name=svar32 value=3>
</td><td width=10%><input type=radio name=svar32 value=2>
</td><td width=10%><input type=radio name=svar32 value=1></td>
<td width=10%></td><td width=10%><input type=radio name=diff32 value=4>
</td><td width=10%><input type=radio name=diff32 value=3>
</td><td width=10%><input type=radio name=diff32 value=2>
</td> <td width=10%><input type=radio name=diff32 value=1>
</td></tr>
<tr>
<td></td>
<td colspan=10>
<img src=/val98/images/velgerguiden-svar.gif HEIGHT=32 WIDTH=590 border=0>
</td>
</tr>

</TABLE>
<P><input type="submit"  value="Resultat"></form>
<p>
</TD>
Om du inte kryssat f&ouml;r b&aring;da kolumnerna p&aring; varje fr&aring;ga f&aring;r du ett felmeddelande.

   </TR>
  </TABLE>

<P><HR WIDTH=489 ALIGN=LEFT></P>
<P><FONT SIZE=-1>&copy; 1998 SvD <A HREF=\"mailto:webmaster\@svd.se\">webmaster\@svd.se</A></FONT></P>
</BODY>
</HTML>

END_SKJEMA1

}

1;
