# SvD:s Väljarkompass 1998

> Sveriges troligen första nätbaserade valkompass — publicerad av Svenska Dagbladet inför riksdagsvalet den 20 september 1998. Nu återupplivad och körbar igen, 27 år senare.

**[➜ Testa Väljarkompassen](https://svd-valkompassen-1998-production.up.railway.app/cgi-bin/val98/valguide.pl)**

---

## Om projektet

Hösten 1998 lanserade SvD en webbaserad tjänst där väljare kunde jämföra sina åsikter med de sju riksdagspartiernas ståndpunkter. Konceptet — som idag kallas valkompass — var nytt för svenska medier. Koden skrevs i Perl/CGI och körde på en Apache-server.

Det här repot är ett digitalt museum-stycke. Målet har varit att återupplivar originalkoden med **absolut minimala ändringar** — inte att modernisera den.

### De sju partierna som deltog

Folkpartiet · Miljöpartiet · Kristdemokraterna · Centerpartiet · Moderaterna · Socialdemokraterna · Vänsterpartiet

---

## Teknik

Applikationen är en klassisk statslös CGI-app från 1998:

| Fil | Beskrivning |
|-----|-------------|
| `val98/valguide.pl` | Huvudskript — visar formuläret och beräknar resultatet |
| `val98/analys.pl` | Statistiksida som visar partitoppen |
| `val98/schema.pl` | HTML-formuläret med 33 frågor |
| `val98/common.pl` | Konfiguration: partier och frågeantal |
| `val98/cgi-lib.pl` | CGI-parser från 1995 (inga externa beroenden) |
| `val98/data.txt` | Partiernas svar — 7 rader × 33 tecken |

---

## Vad som ändrades

Originalkoden var i princip orörd. Dessa minimala justeringar krävdes för att köra på modern infrastruktur:

- **Shebangs** — `#!/usr/local/bin/perl` → `#!/usr/bin/perl`
- **Radslut** — CR-only (klassiska Mac OS 9) konverterades till LF
- **`cgi-lib.pl`** — `$*` togs bort ur Perl 5.30
- **Informationsruta** — en gul notis längst upp på varje sida förklarar kontexten
- **`kompassny.gif`** — saknad bild återställd från befintlig `hej.gif`

Allt annat — HTML, beräkningslogik, formulärstruktur, loggformat — är identiskt med originalet från 1998.

---

## Vad som är autentiskt brutet

Följande fungerar inte längre, och det är helt okej. Det är en del av den autentiska 1998-känslan:

- SvD:s logotyp och bakgrundsbild (döda URLs till `www-b.svd.se`)
- Annonsbanner (döda URLs till `ads.adbannercenter.se`)
- Bildetiketter för svarsalternativ (`velgerguiden-svar.gif`)
- Länken "Fick du det svar du väntade dig?"

---

## Kör lokalt

```bash
docker compose up
```

Öppna sedan: `http://localhost:8080/cgi-bin/val98/valguide.pl`

---

## Deploy

Projektet deployas via [Railway](https://railway.app) direkt från det här repot med hjälp av Dockerfilen. Ingen Railway-specifik konfiguration krävs utöver det.

```
Dockerfile → debian:bookworm-slim + apache2 + perl
```

---

*Originalkod © 1998 Svenska Dagbladet. Återupplivad 2026.*
