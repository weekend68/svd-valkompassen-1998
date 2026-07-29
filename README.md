# SvD:s Väljarkompass 1998

> Troligen Sveriges första valkompass — publicerad av Svenska Dagbladet inför riksdagsvalet den 20 september 1998. Nu återupplivad och körbar igen, 28 år senare.

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
| `kompassforklar.html` | SvD:s originalförklaring av hur Väljarkompassen fungerar, hämtad från Internet Archive |

---

## Vad som ändrades

Originalkoden var i princip orörd. Dessa justeringar krävdes för att köra på modern infrastruktur, eller rättade fel som uppstått på vägen (dålig teckenkodning, trasiga radslut) snarare än att modernisera koden:

- **Shebangs** — `#!/usr/local/bin/perl` → `#!/usr/bin/perl`
- **Radslut** — CR-only (klassiska Mac OS 9) konverterades till LF, både i `.pl`-filerna och i `data.txt`. Den sistnämnda var en genuin bugg: Perl läste hela `data.txt` som en enda rad, vilket gjorde att sex av sju partier jämfördes mot tomma värden och alltid fick identisk poäng.
- **`cgi-lib.pl`** — `$*` togs bort ur Perl 5.30
- **Teckenkodning** — några kvarvarande råa Mac Roman-byte (`Miljöpartiet`, `Vänsterpartiet` m.fl.) konverterades till samma HTML-entitetskonvention som resten av koden
- **Döda bildlänkar** — annons, SvD-logotyp, spacer-gifar och bakgrundsbild pekade på SvD:s nedlagda servrar (`www-b.svd.se`, `ads.adbannercenter.se`). Pekas nu om till lokala kopior; bakgrundsbilden och annonsplatshållaren hittades i ett arkiverat mirror av SvD:s sajt från 1997
- **`<base href>`-bugg** — en felaktig `<base href>` på resultatsidan gjorde att en lokal bild (`strek.gif`) aldrig gick att ladda. Taggen togs bort
- **`velgerguiden-svar.gif`** — bildetiketterna för svarsalternativen var på norska (återanvänd grafik från en norsk "velgerguide"), översatta till svenska
- **`kompassny.gif`** — saknad bild återställd från befintlig `hej.gif` som en tillfällig platshållare (fel skala/motiv på frågesidan, letar fortfarande efter rätt bild)
- **`kompassforklar.html`** — SvD:s originalförklaringssida hämtad från Internet Archive, städad från Wayback-verktygsfältet, länkad in via en länk som redan fanns på frågesidan (pekade tidigare på den döda servern)
- **Viewport-meta** — så sidan renderas i rätt bredd på mobil istället för nedzoomad
- **Informationsruta** — en gul notis längst upp på varje sida förklarar kontexten och länkar till repot
- **Testfusk-knapp** — en knapp på frågesidan som fyller i ett slumpat partis exakta svar (garanterar en träff), för att snabbt kunna testa flödet

Allt annat — HTML, beräkningslogik, formulärstruktur, loggformat — är identiskt med originalet från 1998.

---

## Vad som är autentiskt brutet

Följande fungerar inte längre, och det är helt okej. Det är en del av den autentiska 1998-känslan:

- Länken "Fick du det svar du väntade dig? Svara här" (död URL till `www-b.svd.se`)
- `kompassny.gif` på frågesidan visar fortfarande fel bild (en tillfällig platshållare — rätt bild är inte återfunnen än)

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
