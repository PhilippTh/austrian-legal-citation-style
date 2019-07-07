# Abkrzüngs- und Zitierregeln (AZR)

Eine Umsetzung der AZR in citation style language (CSL). Diese Umsetzung erlaubt es Bibliographieprogrammen wie Zotero oder Mendeley automatisch AZR konforme Zitate zu erstellen.

Folgende Kategorien werden verwendet:

### bill
Die Kategorie "bill" umfasst österreichische und europäische Rechtsnormen. Um den unterschiedlichen Zitierweisen Rechnung zu tragen, wird das Feld "Genre" zur Unterscheidung verwendet. Solange das Feld "Genre" einen Wert enthält wird angenommen, dass es sich um eine europäische Richtlinie oder Verordnung handelt und die Zitierweise entsprechend angepasst.
Diese Umsetzung von AZR gibt für "bill" folgende Informationen wieder:
- title oder short_title: Der Titel der Rechtsnorm beziehungsweise der Kurztitel bei nachfolgenden Zitaten.
- container-title: Die Bezeichnung des Publikationsorgans.
- volume: Der Jahrgang des Publikationsorgans.
- section: Die Nummer im Publikationsorgan.
- page-first: Gegebenenfalls die erste Seite der Veröffentlichung (zB bei dRGBL).
- genre: Der Wert in genre wird nie verwendet. Wenn ein Wert angegeben ist, wird angenommen, dass es sich um Richtlinien oder Verordnungen der Europäischen Union handelt.

Beispiel österreichische Rechtsnormen:

Beispiel Richtlinie oder Verordnung der Europäischen Union:

### legasl_case
Die Kategorie "legal-case" umfasst Entscheidungen österreichischer Gerichte, des EuG, EuGH, EuGöD oder EGMR, sowie Rechsätze. Wie bei "bill" wird auch hier das Feld "Genre" zur Unterscheidung von inländischen und "europäischen" Entscheidungen verwendet. Solange das Feld "Genre" einen Wert enthält, wird angenommen, dass es sich um eine "europäische" Entscheidung handelt.
Diese Umsetzung von AZR gibt für "legal_case" folgende Informationen wieder:
- authority: Das entscheidende Gericht.
- issued: Das Datum der Entscheidung.
- number: Die Aktenzahl der Entscheidung.
- title: Ein Schlagwort mit dem die Entscheidung in der Praxis oder Lehre bezeichnet wird oder bei "europäischen" Entscheidungen die Parteien getrennt durch eine Querstrich.
- locator: Bei "europäischen" Entscheidungen die RZ auf die hingewiesen werden soll. Bei österreichischen, eine Seite in der Fundstelle auf die hingewiesen werden soll.
- container-title: Titel des Publikationsorgans. Entscheidungen des EGMR veröffentlicht dieser selbst.
- volume: Ausgabe des Publikationsorgans. Bei Entscheidungen des EGMR ist dies die vierstellige Jahreszahl, einen Bindestrich und die Bandnummer in römischen Zahlen.
- section: Die Nummer im Publikationsorgan.
- page-first: Die erste Seite der Publikation auf der die Entscheidung zu finden ist.
- author: Wenn die Entscheidung in der Publikation auch besprochen wird, der Name des Kommentators.
- note: Gegebenenfalls kann durch die entsprechende Abkürzung angegeben werden, ob der Kommentator zustimmt (zust), ablehnt (abl), einschränkt(einschr), zweifelt(zwfl) oder kritisiert(krit). Bei Entscheidungen des EGMR kann in note mit (GK) angegeben werden, ob die große Kammer entschieden hat.

Für Rechtsätze wird RIS-Justiz als authority verwendet, als title die Nummer des Rechtsatzes beginnend mit "RS" und gegebenenfalls im Feld "note" Hinweise auf die letzte Zitierung.

Beispiel Entscheidungen österreichischer Gerichte:

Beispiel Entscheidungen EuG, EuGH, EuGöD:

Beispiel Entscheidungen EGMR:

Beispiel Rechtsätze:

### article-journal
Die Kategorie "article-journal" umfasst Aufsätze in juristischen Zeitschriften.
Diese Umsetzung von AZR gibt für "article-journal" folgende Informationen wieder:
- author: Der Autor des Aufsatzes.
- title: Der Titel des Aufsatzes.
- container-title: Der Titel der Zeitschrift.
- volume: Die Ausgabe des Magazins.
- page-first: Die erste Seite des Aufsatzes im Magazin.
- issue: Wenn keine Seite angegeben wird, wird die Nummer des Aufsatzes verwendet.
- locator: Eine Seite auf die hingewiesen werden soll.

Beispiel Aufsätze in Zeitschriften:

### paper-conference
Die Kategorie "paper-conference" umfasst Beiträge in Tagungsbänden. Die dazugehörigen Tagungsbände werden in der Kategorie "book" erfasst.
Diese Umsetzung von AZR gibt für "paper-conference" folgende Informationen wieder:
- author: Der Autor des Beitrags.
- title: Der Titel des Beitrags.
- editor: Der Herausgeber des Beitrags.
- container-title: Der Titel des Tagungsbandes.
- issued: Das Datum der Veröffentlichung des Tagungsbandes.
- page-first: Die erste Seite des Tagungsbandes, die den Beitrag enthält.
- locator: Eine Seite des Beitrags auf die hingewiesen werden soll.

Beispiel Beiträge in Tagungsbänden:

### chapter
Die Kategorie "chapter" umfasst Beiträge in Sammelbänden die keine Tagungsbände sind, Fest- und Gedächtnisschriften und Einträge in Kommentaren. Die dazugehörigen Sammelbände, Fest- und Gedächtnisschriften oder Kommentare werden in der Kategorie "book" erfasst.
Diese Umsetzung von AZR gibt für "chapter" folgende Informationen wieder:
- author: Der Autor des Beitrags.
- title: Der Titel des Beitrags. Wenn kein Titel angegeben wird, wird angenommen, dass es sich um einen Kommentareintrag handelt.
- editor: Der Herausgeber des Sammelbandes oder Kommentars. Wenn kein Herausgeber angegeben wird, wird angenommen, dass es sich um eine Fest- oder Gedächtnisschrift handelt.
- container-title: Der Titel des Sammelbandes, der Fest- oder Gedächtnisschrift oder des Kommentars.
- volume: Der Band in römischen Zahlen und gegebenenfalls nach einem Querstrich der Teilband in arabischen Zahlen und gegebenenfalls noch ein Kleinbuchstabe. Nur bei Kommentareinträgen.
- edition: Die Auflage des Kommentars. Nur bei Kommentareinträgen.
- issued: Das Veröffentlichungsdatum.
- page-first: Die erste Seite des Sammelbandes oder der Fest- oder Gedächtnisschrift auf der der Beitrag erscheint.
- locator: Eine Seite oder eine Randzahl auf die besonders hingewiesen werden soll.

Beispiel Beiträge in Sammelbänden:

Beispiel Beiträge in Fest- oder Gedächtnisschriften:

Beispiel Einträge in Kommentaren:

### book
Die Kategorie "book" umfasst alle Formen von Büchern, das bedeutet Kommentare, Tagungs- und sonstige Sammelbände, Fest- und Gedächtnisschriften und sonstige Bücher. Die jeweiligen Beiträge zu den zuvor genannten Werken werden in der Kategorie "chapter" bzw. "paper-conference" erfasst.
Diese Umsetzung von AZR gibt für "book" folgende Informationen wieder:
- editor: Herausgeber des Kommentares, des Tagungs- oder sonstigen Sammelbändes oder der Fest- und Gedächtnisschrift.
- author: Wenn kein Herausgeber angegeben ist, wird der Autor des Buches angegeben.
- title: Titel des Buches.
- volume: Der Band in römischen Zahlen und gegebenenfalls nach einem Querstrich der Teilband in arabischen Zahlen und gegebenenfalls noch ein Kleinbuchstabe.
- edition: Die Auflage des Buches.
- issued: Das Veröffentlichungsdatum.
- locator: Eine Seite auf die besonders hingewiesen werden soll.

Beispiel für Tagungs oder Sammelbände:

Beispiel für Fest- oder Gedächtnisschriften:

Beispiel für Kommentare:

### thesis
Die Kategorie "thesis" umfasst Dissertationen.
Diese Umsetzung von AZR gibt für "thesis" folgende Informationen wieder:
- author: Der Autor der Dissertation.
- title: Der Titel der Dissertation.
- publisher: Die Universität an der die Dissertation verfasst wurde.
- issued: Das Datum der Veröffentlichung der Dissertation.
- locator: Eine Seite auf die hingewiesen werden soll.

### webpage & post-weblog
Die Kategorien "webpage" und "post-weblog" umfassen Informationen auf Webseiten, Blogpost udgl.
Diese Umsetzung von AZR gibt für "webpage" & "post-weblog" folgende Informationen wieder:
- author: Der Autor des Textes.
- title: Der Titel des Textes.
- URL: Die Webadresse des Textes.
- locator: Eine Seite oder Randzahl auf die besonders hingewiesen werden soll.
- accessed: Datum des letzten Aufrufens des Webseite.

### Andere
Alle nicht in den oben genannten Kategorien enthaltenen Werke werden gleich behandelt.
Dabei werden für alle diese Werke folgende Informationen wiedergegeben:
- author: Der Autor des Werkes.
- title: Der Titel des Werkes.
- container-title: Ein Medium in dem das Werk veröffentlicht wurde.
- issued: Das Veröffentlichungsdatum.
- locator: Eine Seite oder Randzahl auf die besonders hingewiesen werden soll.
