# Abkuerzungs- und Zitierregeln (AZR)

Dieses Repository enthaelt Umsetzungen des Zitierstils **AZR (Abkuerzungs- und Zitierregeln) 7. Auflage** in zwei Formaten:

- **CSL** (Citation Style Language) -- fuer Zotero, Mendeley und andere Literaturverwaltungsprogramme
- **biblatex** -- fuer LaTeX-Dokumente

## Projektstruktur

```
CSL/
  azr-...csl              CSL-Stildatei
biblatex/
  biblatex.cfg             biblatex-Stildatei
  Dockerfile               Docker-Image fuer Tests
  Makefile                 Testbefehle
  tests/
    build.lua              l3build-Konfiguration
    support/               biblatex.cfg (Symlink) + Testbibliografie
    testfiles/             .lvt-Testdateien + .tlg-Referenzausgaben
```

## Umsetzungsstatus

| Kategorie | CSL | biblatex |
|---|---|---|
| Zeitschriftenartikel | vollstaendig | vollstaendig |
| Buecher/Kommentare | vollstaendig | vollstaendig |
| Kommentareintraege | vollstaendig | vollstaendig |
| Sammelbandsbeitraege | vollstaendig | vollstaendig |
| Festschriftenbeitraege | vollstaendig | vollstaendig |
| Tagungsbandsbeitraege | vollstaendig | vollstaendig |
| Dissertationen | vollstaendig | vollstaendig |
| Entscheidungen | vollstaendig | grundlegend |
| Rechtsvorschriften | vollstaendig | grundlegend |
| Onlinewerke | vollstaendig | offen |
| Rechtssaetze | vollstaendig | offen |

Contributions sind willkommen.

---

## Eintraege korrekt erfassen

Die folgenden Abschnitte beschreiben, wie Eintraege in der `.bib`-Datei zu erfassen sind, damit sowohl CSL als auch biblatex korrekte Zitate erzeugen. Fuer jede Kategorie werden die relevanten Felder und das erwartete Ergebnis dokumentiert.

### Allgemeine Regeln

Diese Regeln gelten fuer alle Kategorien (AZR Regeln 60-67):

- **Autorennamen** werden kursiv gesetzt. Vornamen sind nur bei Verwechslungsgefahr anzufuehren. Akademische Grade und Titel entfallen.
- **Mehrere Autoren** werden durch Schraegstrich `/` getrennt (AZR Regel 61).
- **Bindestriche** nur bei Doppelnamen (AZR Regel 62), zB `Fischer-Czermak`.
- **Titel** ohne Anfuehrungszeichen (AZR Regel 63).
- **Bandangaben** in roemischen Ziffern (AZR Regel 80).
- **Auflagen** als hochgestellte Zahl (AZR Regel 82).
- **Seitenzahlen** ohne das Wort "Seite" oder die Abkuerzung "S" (AZR Regel 25).

### Zeitschriftenartikel (AZR Regeln 68-76)

Aufsaetze in juristischen Zeitschriften.

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Autor | `author` | `author` | Autor des Aufsatzes |
| Titel | `title` | `title` | Titel des Aufsatzes |
| Zeitschrift | `container-title` | `journal` | Name der Zeitschrift |
| Jahrgang | `volume` | `year` | Jahrgang/Jahr der Zeitschrift |
| Nummer | `issue` | `number` oder `issue` | Nummer im Jahrgang (alternativ zur Seite) |
| Startseite | `page` / `page-first` | `pages` | Erste Seite des Aufsatzes |

**CSL-Typ:** `article-journal` | **biblatex-Typ:** `@article`

**Beispiel `.bib`:**
```bibtex
@article{zankl2019,
  author  = {Zankl, Wolfgang},
  title   = {Kuenstliche Intelligenz und Immaterialgueterrecht bei Computerkunst},
  journal = {ecolex},
  year    = {2019},
  pages   = {244--246},
}
```

**Erstzitat:** *Zankl*, Kuenstliche Intelligenz und Immaterialgueterrecht bei Computerkunst, ecolex 2019, 244.

**Folgezitat (AZR Regel 76):** *Zankl*, ecolex 2019, 244.

**Pinpoint (AZR Regel 75):** *Zankl*, ecolex 2019, 244 (245).

> Endet der Titel mit einem Frage- oder Rufzeichen, entfaellt der Beistrich nach dem Titel (AZR Regel 69).

### Buecher (AZR Regeln 77-86)

Kommentare, Sammelbande, Monografien und sonstige Buecher.

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Autor | `author` | `author` | Autor(en) des Buches |
| Herausgeber | `editor` | `editor` | Herausgeber (bei Kommentaren, Sammelbaenden) |
| Titel | `title` | `title` | Titel des Buches |
| Kurztitel | `title-short` | `shorttitle` | Fuer Folgezitate (AZR Regel 79) |
| Band | `volume` | `volume` | Bandnummer (roemisch) |
| Auflage | `edition` | `edition` | Auflagenzahl (hochgestellt) |
| Jahr | `issued` | `year` | Erscheinungsjahr |

**CSL-Typ:** `book` | **biblatex-Typ:** `@book` (auch `@mvbook`)

**Beispiel `.bib` (Monografie):**
```bibtex
@book{schweighofer1999,
  author     = {Schweighofer, Erich},
  title      = {Rechtsinformatik und Wissensrepraesentation},
  shorttitle = {Rechtsinformatik},
  year       = {1999},
}
```

**Erstzitat (AZR Regel 86):** *Schweighofer*, Rechtsinformatik und Wissensrepraesentation (1999).

**Folgezitat (AZR Regel 79):** *Schweighofer*, Rechtsinformatik.

**Beispiel `.bib` (Kommentar mit Band und Auflage):**
```bibtex
@book{jabornegg2005,
  author  = {Jabornegg and Strasser},
  title   = {AktG},
  volume  = {2},
  edition = {5},
  year    = {2005},
}
```

**Erstzitat:** *Jabornegg/Strasser*, AktG II<sup>5</sup> (2005).

> Bei Aufeinandertreffen einer hochgestellten Auflagenzahl mit einer Seitenzahl ist kein Beistrich zu setzen (AZR Regel 25).

### Kommentareintraege (AZR Regel 78)

Beitraege einzelner Autoren zu einem von mehreren verfassten Kommentar.

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Autor | `author` | `author` | Autor des Beitrags |
| Paragraph | -- | `title` | Paragraphenangabe, zB `\S~254` |
| Herausgeber | `editor` | `editor` | Herausgeber des Kommentars |
| Buchtitel | `container-title` | `booktitle` | Titel des Kommentars |
| Band | `volume` | `volume` | Bandnummer (roemisch) |
| Auflage | `edition` | `edition` | Auflagenzahl (hochgestellt) |
| Jahr | `issued` | `year` | Erscheinungsjahr |

**CSL-Typ:** `chapter` (ohne `title`) | **biblatex-Typ:** `@inbook`

**Abgrenzung zu `@incollection`:** Der Typ `@inbook` ist ausschliesslich fuer Kommentareintraege (AZR Regel 78) vorgesehen. Es wird kein `(Hrsg)` nach dem Herausgeber angezeigt, da die Herausgebernamen Teil der Werkbezeichnung sind. Beitraege in Sammelbanden, Festschriften oder Tagungsbaenden (AZR Regeln 70-71) sind mit `@incollection` bzw `@inproceedings` zu erfassen.

Das Feld `title` enthaelt die Paragraphenangabe (zB `\S~254`), die den Beitrag identifiziert (AZR Regel 78). Sie wird immer angezeigt. Die Randzahl (Rz) variiert je nach Zitierungsstelle und wird als Postnote uebergeben.

**Beispiel `.bib`:**
```bibtex
@inbook{jabornegg_geist2005,
  author   = {Jabornegg and Geist},
  title    = {\S~254},
  crossref = {jabornegg2005},
}
```

> Die Felder `booktitle`, `volume`, `edition` und `year` werden automatisch vom `@book`-Eintrag `jabornegg2005` geerbt (siehe oben).

**Erstzitat:** `\footcite[Rz 5]{jabornegg_geist2005}` &rarr; *Jabornegg/Geist* in *Jabornegg/Strasser*, AktG II<sup>5</sup> (2005) &sect; 254 Rz 5.

**Folgezitat:** `\footcite[Rz 5]{jabornegg_geist2005}` &rarr; *Jabornegg/Geist* in *Jabornegg/Strasser*, AktG II<sup>5</sup> &sect; 254 Rz 5.

> Kommentareintraege (`@inbook`) scheinen automatisch nicht im Literaturverzeichnis auf. Ueber das Feld `crossref` wird der uebergeordnete `@book`-Eintrag verknuepft -- dieser erscheint dann automatisch im Literaturverzeichnis (dank `mincrossrefs=1`), ohne dass `\nocite` noetig ist. Ausserdem erbt der `@inbook`-Eintrag alle Felder (`booktitle`, `volume`, `edition`, `year`) vom `@book`, sodass keine Duplizierung noetig ist:
>
> ```bibtex
> % Gesamtwerk -- erscheint automatisch im Literaturverzeichnis
> @book{jabornegg2005,
>   author  = {Jabornegg and Strasser},
>   title   = {AktG},
>   volume  = {2},
>   edition = {5},
>   year    = {2005},
> }
>
> % Einzelbeitrag -- nur author, title und crossref noetig
> @inbook{jabornegg_geist2005,
>   author   = {Jabornegg and Geist},
>   title    = {\S~254},
>   crossref = {jabornegg2005},
> }
> ```

> Bei allgemein bekannten Werken (AZR Regel 85) kann der `booktitle` im `.bib`-Eintrag direkt gekuerzt oder weggelassen werden. Beispiel: *Buchegger* in *Fasching/Konecny* II/2 &sect; 123 ZPO Rz 16.

### Beitraege in Sammelbanden (AZR Regel 71)

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Autor | `author` | `author` | Autor des Beitrags |
| Titel | `title` | `title` | Titel des Beitrags |
| Herausgeber | `editor` | `editor` | Herausgeber des Sammelbandes |
| Buchtitel | `container-title` | `booktitle` | Titel des Sammelbandes |
| Jahr | `issued` | `year` | Erscheinungsjahr |
| Startseite | `page` / `page-first` | `pages` | Erste Seite des Beitrags |

**CSL-Typ:** `chapter` (mit `title` und `editor`) | **biblatex-Typ:** `@incollection`

**Beispiel `.bib`:**
```bibtex
@incollection{deixler2001,
  author    = {Deixler-Huebner},
  title     = {Die neuen familienrechtlichen Verfahrensbestimmungen},
  booktitle = {Reform des Kindschaftsrechts},
  editor    = {Ferrari and Hopf},
  year      = {2001},
  pages     = {115},
}
```

**Erstzitat:** *Deixler-Huebner*, Die neuen familienrechtlichen Verfahrensbestimmungen, in *Ferrari/Hopf* (Hrsg), Reform des Kindschaftsrechts (2001) 115.

**Folgezitat (AZR Regel 76):** *Deixler-Huebner* in *Ferrari/Hopf* 115.

### Beitraege in Fest- oder Gedaechtnisschriften (AZR Regel 70)

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Autor | `author` | `author` | Autor des Beitrags |
| Titel | `title` | `title` | Titel des Beitrags |
| Buchtitel | `container-title` | `booktitle` | zB "FS 200 Jahre ABGB" |
| Jahr | `issued` | `year` | Erscheinungsjahr |
| Startseite | `page` / `page-first` | `pages` | Erste Seite des Beitrags |

**CSL-Typ:** `chapter` (mit `title`, ohne `editor`) | **biblatex-Typ:** `@incollection`

> Bei Festschriften wird kein Herausgeber angegeben. Stattdessen wird der Buchtitel mit "FS" oder "GedS" eingeleitet.

**Beispiel `.bib`:**
```bibtex
@incollection{neumayr2011,
  author    = {Neumayr},
  title     = {Die Entwicklung des Kindschaftsrechts},
  booktitle = {FS 200 Jahre ABGB},
  year      = {2011},
  pages     = {495},
}
```

**Erstzitat:** *Neumayr*, Die Entwicklung des Kindschaftsrechts, in FS 200 Jahre ABGB (2011) 495.

**Folgezitat (AZR Regel 76):** *Neumayr* in FS 200 Jahre ABGB 495.

### Beitraege in Tagungsbaenden (AZR Regel 71)

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Autor | `author` | `author` | Autor des Beitrags |
| Titel | `title` | `title` | Titel des Beitrags |
| Herausgeber | `editor` | (nicht erforderlich) | Herausgeber des Tagungsbands |
| Buchtitel | `container-title` | `booktitle` | Titel des Tagungsbands |
| Jahr | `issued` | `year` | Erscheinungsjahr |
| Startseite | `page` / `page-first` | `pages` | Erste Seite des Beitrags |

**CSL-Typ:** `paper-conference` | **biblatex-Typ:** `@inproceedings`

**Beispiel `.bib`:**
```bibtex
@inproceedings{havur2019,
  author    = {Havur, Giray and Steyskal, Simon and Panasiuk, Oleksandra},
  title     = {DALICC: A Framework for Publishing and Consuming Data Assets Legally},
  booktitle = {Internet of Things: Tagungsband des 22. Internationalen
               Rechtsinformatik Symposions IRIS 2019},
  year      = {2019},
  pages     = {4},
}
```

### Dissertationen

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Autor | `author` | `author` | Autor der Dissertation |
| Titel | `title` | `title` | Titel der Dissertation |
| Universitaet | `publisher` | `institution` | Universitaet |
| Jahr | `issued` | `year` | Erscheinungsjahr |

**CSL-Typ:** `thesis` | **biblatex-Typ:** `@thesis` (mit `type = {phdthesis}`)

**Beispiel `.bib`:**
```bibtex
@thesis{scharf2015,
  author      = {Scharf, Johannes},
  title       = {Wissensrepraesentation und automatisierte Entscheidungsfindung
                 am Beispiel des Kriegsopferversorgungsgesetzes},
  type        = {phdthesis},
  institution = {Universitaet Wien},
  year        = {2015},
}
```

**Erstzitat:** *Scharf*, Wissensrepraesentation und automatisierte Entscheidungsfindung am Beispiel des Kriegsopferversorgungsgesetzes (2015).

### Entscheidungen (AZR Regeln 40-59)

#### Oesterreichische Entscheidungen (AZR Regeln 40-41, 46-59)

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Gericht | `authority` | `institution` | zB OGH, VwGH, VfGH |
| Datum | `issued` | `date` | Datum der Entscheidung |
| Aktenzahl | `number` | `number` | Geschaeftszahl |
| Schlagwort | `title` | `title` | Bezeichnung der Entscheidung (kursiv) |
| Fundstelle | `container-title` | -- | Titel des Publikationsorgans |
| Jahrgang | `volume` | -- | Jahrgang des Publikationsorgans |
| Nummer | `section` | -- | Nummer im Publikationsorgan |
| Seite | `page-first` | -- | Erste Seite |
| Kommentator | `author` | -- | Verfasser einer Besprechung |
| Vermerk | `note` | -- | zust, abl, einschr, zwfl, krit |

**CSL-Typ:** `legal_case` | **biblatex-Typ:** `@jurisdiction`

**Beispiel:** OGH 7 Ob 197/07g EF-Z 2008/86 (zust *Gitschthaler*).

#### EuGH/EuG/EuGoeD (AZR Regel 42)

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Gericht | `authority` | `institution` | EuGH, EuG oder EuGoeD |
| Datum | `issued` | `date` | Veroeffentlichungsdatum |
| Aktenzahl | `number` | `number` | zB C-296/10 |
| Parteien | `title` | `title` | Parteienbezeichnung (kursiv) |

**Beispiel:** EuGH 9. 11. 2010, C-296/10, *Purrucker/Valles Perez*.

#### EGMR (AZR Regel 43)

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Gericht | `authority` | `institution` | EGMR |
| Datum | `issued` | `date` | Datum der Entscheidung |
| Grosse Kammer | `note` | -- | "(GK)" bei Entscheidungen der Grossen Kammer |
| Beschwerdenr. | `number` | `number` | Beschwerdenummer |
| Name | `title` | `title` | Parteienbezeichnung (kursiv) |

**Beispiel:** EGMR 26. 10. 2000 (GK), 30210/96, *Kudla* EGMR 2000-XI.

#### Rechtssaetze (AZR Regel 59)

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Behoerde | `authority` | -- | "RIS-Justiz" |
| Nummer | `title` | -- | zB RS0061119 |
| Hinweis | `note` | -- | Letzte Zitierung |

**Beispiel:** RIS-Justiz RS0061119, zuletzt OGH 14 Os 108/08a EvBl 2008/174.

### Rechtsvorschriften (AZR Regeln 29-32)

#### Oesterreichische Rechtsvorschriften (AZR Regeln 29-30)

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Titel | `title` | `title` | Bezeichnung der Rechtsvorschrift |
| Kurztitel | `title-short` | -- | Abkuerzung fuer Folgezitate |
| Publikationsorgan | `container-title` | -- | zB BGBl, LGBl, JABl |
| Jahrgang | `volume` | -- | Jahrgang des Publikationsorgans |
| Nummer | `section` | -- | Nummer der Rechtsvorschrift |
| Seite | `page-first` | -- | Erste Seite (zB bei dRGBl) |

**CSL-Typ:** `bill` oder `legislation` | **biblatex-Typ:** `@legislation`

**Beispiel:** Einfuehrungserlass zur SMG-Novelle 2007 JABl 2008/9.

#### EU-Rechtsvorschriften (AZR Regeln 31-32)

Wie oesterreichische Rechtsvorschriften, aber:
- `genre`: Wenn ein Wert angegeben ist, wird EU-Formatierung verwendet (der Wert selbst wird nie angezeigt).
- Verordnungen werden mit "VO", Richtlinien mit "RL" abgekuerzt.
- Zwischen Bezeichnung und Kundmachungsorgan wird ein Beistrich gesetzt.

**Beispiel (Erstzitat):** RL 2003/9/EG des Rates vom 27. 1. 2003 zur Festlegung von Mindestnormen fuer die Aufnahme von Asylwerbern in den Mitgliedstaaten, ABl L 2003/31, 18.

**Beispiel (Folgezitat):** AufnahmeRL 2003/9 ABl L 2003/31, 18.

### Onlinewerke (AZR Regeln 87-88)

| Feld | CSL-Feld | biblatex-Feld | Beschreibung |
|---|---|---|---|
| Autor | `author` | `author` | Autor des Textes |
| Titel | `title` | `title` | Titel des Textes |
| URL | `URL` | `url` | Webadresse |
| Stand/Abfrage | `issued` / `accessed` | `urldate` | Datum des Stands oder Abrufs |

**CSL-Typ:** `webpage` oder `post-weblog` | **biblatex-Typ:** `@online`

**Beispiel:** *Vary/Mutimear*, Artificial Intelligence -- Navigating the IP challenges https://... (aufgerufen am 11.06.2019).

---

## Nicht automatisch umsetzbare Regeln

Folgende AZR-Regeln koennen weder in CSL noch in biblatex vollstaendig automatisiert werden und muessen nach der Generierung manuell korrigiert werden:

1. **Wiederholte Behoerdennennung:** Werden in derselben Fussnote mehrere Entscheidungen derselben Behoerde zitiert, entfaellt ab der zweiten Nennung die Behoerdenbezeichnung.
2. **Mehrere Fundstellen:** Mehrere Veroeffentlichungsstellen derselben Entscheidung sind durch "=" zu verbinden.
3. **Bedingter Beistrich nach dem Titel:** Nach dem Titel eines Beitrags wird nur dann ein Beistrich gesetzt, wenn der Titel nicht mit einem Satzzeichen endet (in biblatex umgesetzt, in CSL nicht moeglich).

---

## CSL-Stil

### Installation

Die CSL-Datei befindet sich unter `CSL/`. Sie kann direkt in Zotero oder Mendeley importiert werden:

- **Zotero:** Einstellungen > Zitieren > Stile > "+" > Datei waehlen
- **Mendeley:** Ansicht > Zitierstil > Weitere Stile > Datei ziehen

### Besonderheiten

- Das Feld `genre` dient als Schalter fuer EU-Formatierung (bei `legislation` und `legal_case`). Der Inhalt wird nie angezeigt -- es genuegt, einen beliebigen Wert einzutragen.
- Bei `legal_case` ohne `genre` wird eine oesterreichische Entscheidung angenommen.
- Bei `chapter` ohne `title` wird ein Kommentareintrag angenommen.
- Bei `chapter` ohne `editor` wird eine Festschrift angenommen.
- Kommentareintraege und Rechtssaetze erscheinen nicht im Literaturverzeichnis.
- Die Bibliografie ist nach Literatur, Entscheidungen und Rechtsvorschriften sortiert.

---

## biblatex-Stil

### Installation

Die Datei `biblatex/biblatex.cfg` muss im selben Verzeichnis wie das LaTeX-Hauptdokument liegen oder im TeX-Suchpfad verfuegbar sein.

```latex
\usepackage[style=authortitle,backend=biber]{biblatex}
\addbibresource{literatur.bib}
```

> Die Option `style=authortitle` ist erforderlich. Der `biblatex.cfg` ueberschreibt den Zitierstil auf `verbose` und nutzt die `dashed`-Option des `authortitle`-Bibliografiestils.

### Literaturverzeichnis

Kommentareintraege (`@inbook`) erscheinen automatisch nicht im Literaturverzeichnis. Wenn `@inbook`-Eintraege das Feld `crossref` verwenden, wird der uebergeordnete `@book`-Eintrag automatisch ins Literaturverzeichnis aufgenommen -- ohne `\nocite` oder sonstige Eingriffe:

```latex
\printbibliography
```

> Technisch: `@inbook`-Eintraege erhalten automatisch die Option `skipbib` (via `DeclareSourcemap`). Die Option `mincrossrefs=1` sorgt dafuer, dass bereits ein einziger `@inbook`-Verweis den uebergeordneten `@book`-Eintrag ins Literaturverzeichnis aufnimmt.

### Unterstuetzte Eintragstypen

| biblatex-Typ | Beschreibung |
|---|---|
| `@article` | Zeitschriftenartikel |
| `@book`, `@mvbook` | Buecher, Kommentare, Sammelbande |
| `@inbook` | Kommentareintraege |
| `@incollection` | Sammelbands- und Festschriftenbeitraege |
| `@inproceedings` | Tagungsbandsbeitraege |
| `@thesis`, `@report` | Dissertationen und Berichte |
| `@jurisdiction` | Entscheidungen |
| `@legislation` | Rechtsvorschriften |
| `@online` | Onlinewerke (noch nicht implementiert) |

### Formatierungsregeln

- Autorennamen werden kursiv gesetzt und durch `/` getrennt.
- Titel ohne Anfuehrungszeichen und ohne Kursivierung.
- Band in roemischen Ziffern, Auflage als hochgestellte Zahl.
- Erstzitate enthalten den vollen Titel und das Erscheinungsjahr in Klammern.
- Folgezitate verwenden den Kurztitel (falls vorhanden) ohne Jahresangabe.
- Bei `@article` mit Postnote: Startseite gefolgt von der Postnote in Klammern.

---

## Tests (biblatex)

Der biblatex-Stil wird mit [l3build](https://ctan.org/pkg/l3build) getestet, dem Standard-Testframework der LaTeX3-Projekts. Die Tests laufen in einem Docker-Container mit TeX Live.

### Voraussetzungen

- [Docker](https://docs.docker.com/get-docker/)

### Befehle

Alle Befehle werden aus dem Verzeichnis `biblatex/` ausgefuehrt:

```bash
# Docker-Image bauen (einmalig)
make build

# Alle Regressionstests ausfuehren
make test

# Referenzausgabe fuer einen einzelnen Test aktualisieren
make save T=article

# Referenzausgabe fuer alle Tests aktualisieren
make save-all

# Build-Artefakte entfernen
make clean
```

### Teststruktur

Jeder Test besteht aus zwei Dateien in `biblatex/tests/testfiles/`:

- **`.lvt`** -- LaTeX-Testdokument, das Zitate mit `\footcite` erzeugt und die Ausgabe mit `\showbox` im Log erfasst.
- **`.tlg`** -- Erwartete Referenzausgabe (wird mit `make save` generiert und bei `make test` verglichen).

| Testdatei | Eintragstyp | AZR-Regeln |
|---|---|---|
| `article.lvt` | `@article` | 68-76 |
| `book.lvt` | `@book` | 77-86 |
| `inbook.lvt` | `@inbook` | 78 |
| `incollection.lvt` | `@incollection` | 70-71 |
| `inproceedings.lvt` | `@inproceedings` | 71 |
| `thesis.lvt` | `@thesis` | -- |
| `jurisdiction.lvt` | `@jurisdiction` | 40-45 |
| `legislation.lvt` | `@legislation` | 29-32 |

### Workflow

1. **Stil aendern:** `biblatex/biblatex.cfg` bearbeiten.
2. **Tests ausfuehren:** `make test` -- schlaegt fehl, wenn sich die Ausgabe geaendert hat.
3. **Ausgabe pruefen:** Die Aenderung manuell gegen die AZR-Regeln pruefen.
4. **Referenz aktualisieren:** `make save-all` um die neuen Referenzausgaben zu speichern.
5. **Erneut testen:** `make test` -- sollte jetzt bestehen.

---

## Lizenz

Creative Commons Attribution-ShareAlike 3.0 (CC BY-SA 3.0)
