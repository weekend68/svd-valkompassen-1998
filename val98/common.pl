#!/usr/local/bin/perl

# Andra garna denna rad !
$max_antal_fragor = 33;

# Andra garna nedanstaende !
# Observera att antalet partier varieras genom tre atgarder:
# - Satt variabeln "$antal_partier" nedan till ratt varde
# - skriv in ratt antal namn har nedan
# - Se till att data.txt innehaller lika manga rader och i samma ordning som nedan

$antal_partier = 7;

@parti_navn = (
"Folkpartiet",
"Milj&ouml;partiet",
"Kristdemokraterna",
"Centerpartiet",
"Moderaterna",
"Socialdemokraterna",
"V&auml;nsterpartiet"

);

sub numeri { $a <=> $b }

sub reversed { $b cmp $a }

