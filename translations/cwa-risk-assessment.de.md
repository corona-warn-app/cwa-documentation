# Wie ermittelt die Corona-Warn-App ein erhöhtes Risiko?

Dieses Dokument ist **nicht mehr aktuell**. Es beschreibt die ursprüngliche Risikoberechnung in der Corona-Warn-App vor Version 1.5 (im Oktober 2020 veröffentlicht) und wird hier aus Dokumentationsgründen noch beibehalten. Eine aktuelle Beschreibung der Risikoanalyse und -berechnung in der Corona-Warn-App befindet sich im Dokumentenabschnitt [Solution Architecture > Mobile Application](../solution_architecture.md#mobile-applications) (auf Englisch).

<br /><br />

## WICHTIG! - DOKUMENT ZURÜCKGEZOGEN

**Der Inhalt dieses Dokuments entspricht nicht mehr dem aktuellen Stand und wird nicht weiter gepflegt.**

<br /><br />

---

## Voraussetzungen

Personen, die die Corona-Warn-App (CWA) nutzen und positiv auf das Coronavirus SARS-CoV-2 getestet wurden, können ihrer CWA erlauben, die vom Betriebssystem ihres Smartphones erzeugten zufälligen Geräteschlüssel (*Temporary Exposure Keys*) der vergangenen Tage als sogenannte Positivkennungen (*Diagnosis Keys*) auf den Corona-Warn-App-Server hochzuladen und dort zu veröffentlichen.
Diese Positivkennungen sind die Grundlage der Risikoermittlung für alle anderen die CWA nutzenden Personen.

Eine Corona-positiv getestete Person lädt bis zu 15 Positivkennungen hoch, nämlich je eine für jeden der bis zu 14 letzten Tage vor dem Hochladen sowie (derzeit noch nicht umgesetzt) am folgenden Tag die für den aktuellen Tag.
Letzteres ist nötig, da Positivkennungen nur für bereits vergangene Tage hochgeladen werden können, um Missbrauch noch aktiver Positivkennungen zu verhindern.

Positivkennungen lassen keine Rückschlüsse auf die Identität der positiv getesteten Person zu, aber die Positivkennung eines bestimmten Tages passt zu den ständig wechselnden Zufallscodes (*Rolling Proximity Identifiers*), die das Smartphone der Person den ganzen Tag über mittels Bluetooth versendet hat und die von anderen Smartphones in der Nähe empfangen und aufgezeichnet wurden.
An jede Positivkennung ist noch ein Wert angehängt, der angibt, wie groß das Übertragungsrisiko (*Transmission Risk Level*) der positiv getesteten Person an dem Tag, zu dem die Positivkennung gehört, vermutlich gewesen ist. Dieses Übertragungsrisiko wird anhand von Erfahrungswerten unter Berücksichtigung der aktuell vorliegenden wissenschaftlichen Erkenntnisse [in einem mathematischen Verfahren geschätzt](../transmission_risk.pdf).
Jede Positivkennung verfällt, wenn sie älter als 14 Tage ist. Deshalb sind stets nur die Positivkennungen der letzten 14 Tage verfügbar.

## Verfahren

Alle aktiven Corona-Warn-Apps laden täglich vom Corona-Warn-App-Server die dort veröffentlichten Positivkennungen herunter und übergeben sie gesammelt über eine Schnittstelle an das Betriebssystem des Smartphones.
Dort wird geprüft, ob empfangene und aufgezeichnete Zufallscodes der letzten 14 Tage vorliegen, die zu einer der Positivkennungen passen.
Ein solches Zusammenpassen zeigt an, dass sich das Smartphone, das die Zufallscodes aufgezeichnet hat, und das Smartphone der Corona-positiv getesteten Person, die die Positivkennung hochgeladen hat, an dem Tag, zu dem die Positivkennung gehört, begegnet sind.

> NB: Tage im Kontext der Corona-Warn-App und damit auch dieses Dokuments sind Kalendertage nach UTC (Coordinated Universal Time). Der Tageswechsel erfolgt demnach um 1 Uhr Mitteleuropäischer Zeit bzw. 2 Uhr Mitteleuropäischer Sommerzeit.

Als nächstes wird im Betriebssystem des Smartphones für jede Positivkennung anhand aller dazu passenden Zufallscodes geschätzt, wie lange die Begegnungen jenes Tags insgesamt gedauert haben und wie nahe die beiden Smartphones sich dabei im Durchschnitt waren.
Die Entfernung wird aus der gemessenen Abschwächung des Bluetooth-Signals errechnet, die in dB (Dezibel) angegeben wird.
Jedem dB-Wert lässt sich eine Entfernung im Freiraum (d.h., ohne Hindernisse im Signalweg; s.a. Erläuterungen im Abschnitt "Folgen und Einschränkungen") zuordnen.
Alle Begegnungen zu einer Positivkennung, die insgesamt weniger als 10 Minuten gedauert haben (egal, wie nahe sich die Smartphones dabei gekommen sind) oder bei denen die Smartphones im Durchschnitt mehr als ca. 8 Meter Freiraum (>73 dB Dämpfung) voneinander entfernt waren (egal, wie lange sie insgesamt gedauert haben), werden als unbedenklich verworfen.

> NB: Wir bezeichnen die Gesamtheit aller Begegnungen, die jeweils zu einer bestimmten Positivkennung gehören, also alle Begegnungen eines Tages zwischen denselben zwei Smartphones, im Weiteren als Begegnungsmenge.

Bei den restlichen, nicht als unbedenklich verworfen Begegnungen wird für jede Begegnungsmenge ein Begegnungsrisiko (*Total Risk Score*) errechnet, indem der oben erläuterte Übertragungsrisikowert mit einem Verzugsrisikowert (*Days Since Last Exposure Value*) multipliziert wird, der sich aus der Anzahl der seit der Begegnung vergangenen Tage ableitet.

Alle Begegnungsmengen, deren Begegnungsrisiko dabei einen bestimmten Grenzwert (*Minimum Risk Score*) überschreitet, werden als Risikobegegnungen angesehen.
Die anderen Begegnungsmengen werden ebenso wie zuvor schon die zu kurzen oder zu entfernten Begegnungsmengen als unbedenklich verworfen.

Zugleich wird für alle verbleibenden Begegnungsmengen, die Risikobegegnungen, zusammengezählt, wieviel Zeit in einem sehr nahen Entfernungsbereich unter ca. 1,5 Metern (<55 dB Dämpfung) verbracht wurde und wieviel Zeit in einem nahen Entfernungsbereich zwischen ca. 1,5 und 3 Metern (55 bis 63 dB Dämpfung) verbracht wurde.
Dabei wird die Zeit im sehr nahen Bereich ganz und die Zeit im nahen Bereich zur Hälfte gezählt.
Die in einer Entfernung von mehr als ca. 3 Metern verbrachte Zeit wird nicht gezählt.

Die so errechnete Gesamtzeit aller Risikobegegnungen der letzten 14 Tage wird dann noch mit dem Begegnungsrisiko der Risikobegegnung mit dem höchsten Risiko (*Maximum Risk Score*) verrechnet.
Und zwar so, dass sie unverändert bleibt, wenn dieses Risiko als "durchschnittlich" (für Risikobegegnungen) eingeschätzt wird, dass sie sich bis auf das ungefähr anderthalbfache verlängert, wenn dieses Risiko überdurchschnittlich ist, und entsprechend verkürzt, wenn dieses Risiko unterdurchschnittlich ist.
Dadurch kann eine Zeit, die zuvor 10 Minuten betrug, auf über 15 Minuten verlängert werden und eine Zeit, die zuvor 25 Minuten betrug, auf 15 Minuten verkürzt werden.

## Folgen und Einschränkungen

Am Ende wird die die CWA nutzende Person immer dann über ein erhöhtes Risiko benachrichtigt, wenn die so ermittelte gesamte Risikobegegnungszeit 15 Minuten oder länger ist.
Diese Benachrichtigung erfolgt in der CWA und gibt der Person zugleich Handlungsempfehlungen für das weitere Vorgehen.

Bei der Bewertung der von der CWA ermittelten Zeiten und Entfernungen muss berücksichtigt werden, dass beide Parameter nicht exakt gemessen werden können.
Die einzelnen gemessenen Zeiten können bis zu 5 Minuten in beide Richtungen abweichen und die ermittelten Entfernungen sind Näherungswerte unter Idealbedingungen, d.h., wenn z.B. keine Hindernisse zwischen den beiden Smartphones sind.
Schon bei kleineren Hindernissen, z.B. einer Person zwischen den beiden Smartphones oder wenn das Smartphone abgeschirmt verstaut ist, kann die Entfernung doppelt so groß erscheinen wie sie wirklich ist.

Aufgrund von Datenschutzerwägungen können die oben beschriebenen Eigenschaften an der Schnittstelle zum Betriebssystem vorerst nur für die Gesamtheit aller Risikobegegnungen abgefragt werden, nicht aber für einzelne Risikobegegnungen oder tageweise.
Solange die Anzahl neuer Fälle vergleichsweise gering bleibt, dürfte das keinen großen Unterschied machen, da vermutlich nur wenige die CWA nutzende Personen im Zeitraum vor ihrer Benachrichtigung Risikobegegnungen mit mehreren positiv getesteten Personen haben, die die CWA nutzen.

## Ein Beispiel

Anton und Aisha werden am 20. eines Monats über ihr jeweils Corona-positives Testergebnis informiert.
Anton erlaubt noch am selben Tag seiner CWA, andere die CWA nutzende Personen, mit denen er Risikobegegnungen hatte, darüber zu informieren.
Er hat die CWA auf seinem Smartphone seit einer Woche durchgehend aktiviert.
Die CWA lädt nun seine zufälligen Geräteschlüssel der letzten 7 Tage (mehr sind nicht verfügbar, da Anton die CWA erst 8 Tage im Einsatz hat und der aktuelle Geräteschlüssel noch nicht hochgeladen werden kann) als Positivkennungen auf den CWA-Server hoch.
Sie werden mit den Übertragungsrisikograden VI (für den Vortag), dreimal VIII (für den 16. bis 18.), V, III und I (rückwärts für die anderen vorausgegangenen Tage, 13. bis 15.) versehen.

|||||||||
|-|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Übertragungsrisikograd|VI|VIII|VIII|VIII|V|III|I|
|Abstand zum Tag der Upload-Zustimmung|1|2|3|4|5|6|7|
|Erzeugungsdatum des Schlüssels|19.|18.|17.|16.|15.|14.|13.|

Tabelle 1: Übertragungsrisikograd für Antons 7 geteilte Positivkennungen, basierend auf dem Abstand zum Tag der Upload-Zustimmung (20.)

Aisha zögert noch einen Tag und gibt ihre Zustimmung erst am 21. des Monats.
Da sie ihre CWA schon vor mehreren Wochen aktiviert hatte und seitdem durchgehend im Hintergrund laufen hatte, stehen ihre zufälligen Geräteschlüssel der letzten 14 Tage zum Hochladen zur Verfügung.
Auch ihren Positivkennungen werden die Übertragungsrisikograde VI, dreimal VIII, V, III und I rückwärts für die 7 vorausgegangenen Tage vergeben, allerdings beginnend mit dem 20. und damit einen Tag gegenüber Anton versetzt.
(Dass beide am selben Tag über ihr Testergebnis informiert wurden, weiß die CWA nicht. In der aktuellen Version steht ihr nur das Datum der Zustimmung zum Hochladen für die Ermittlung des tagesspezifischen Übertragungsrisikograds zur Verfügung.)
Für die 7 noch weiter zurückliegenden Tage, den Zeitraum vom 7. bis zum 13. des Monats, wird jeweils der Übertragungsrisikograd I vergeben.

||||||||||||||||
|-|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Übertragungsrisikograd|VI|VIII|VIII|VIII|V|III|I|I|I|I|I|I|I|I|
|Abstand zum Tag der Upload-Zustimmung|1|2|3|4|5|6|7|8|9|10|11|12|13|14|
|Erzeugungsdatum des Schlüssels|20.|19.|18.|17.|16.|15.|14.|13.|12.|11.|10.|9.|8.|7.|

Tabelle 2: Übertragungsrisikograd für Aishas 14 geteilte Positivkennungen, basierend auf dem Abstand zum Tag der Upload-Zustimmung (21.)

Anton und Aisha fahren regelmäßig zusammen mit dem Bus zur Arbeit.
Betty hat denselben Arbeitsweg und sitzt gelegentlich im selben Bus.
Alle drei beschäftigen sich während der Fahrt mit ihren Smartphones, so dass den Bluetooth-Signalen keine Hindernisse im Weg sind.
Betty hat Anton und Aisha am 9. und am 16. morgens und abends für jeweils 10 Minuten getroffen.
Anton saß dabei einen Meter von ihr entfernt und Aisha zwei.

Als Bettys CWA am 21. Antons Positivkennungen abruft und an die Schnittstelle des Betriebssystems ihres Smartphones übergibt, wird eine Begegnungsmenge für den 16. erkannt.
(Für den 9. hat Antons CWA keine Positivkennung hochgeladen.)
Diese Begegnungsmenge hat insgesamt 20 Minuten gedauert und die Smartphones waren im Durchschnitt einen Meter voneinander entfernt.
Daraus ergeben sich Werte von jeweils 1 für die Dauer und die Dämpfung (s.a. "Konfiguration von Begegnungen" im Abschnitt "Aktuelle Konfiguration").

Damit ist sichergestellt, dass diese Begegnungsmenge nicht verworfen wird.
Der Wert des Parameters für das Verzugsrisiko (21 - 16 = 5 Tage) ist durchgehend mit 5 konfiguriert und der Wert des Parameters für das Übertragungsrisiko wird eins-zu-eins vom Übertragungsrisikograd übernommen, beträgt also 8.
Das Begegnungsrisiko errechnet sich damit als 1 x 1 x 5 x 8 = 40, was übrigens der höchste mit der aktuellen Konfiguration erreichbare Wert ist.
Der Grenzwert von 11 wird überschritten, womit die Begegnungsmenge als Risikobegegnung zählt.

| | | | | | | | | |
|-|-|-|-|-|-|-|-|-|
|Verzugsrisiko| ≥14d (5) | 12-13d (5) | 10-11d (5) | 8-9d (5) | 6-7d (5) | **4-5d (5)** | 2-3d (5) | 0-1d (5) |
|Dämpfung| >73dB (0) | >63-≤73dB (1) | >51-≤63dB (1) | **>33-≤51dB (1)** | >27-≤33dB (1) | >15-≤27dB (1) | >10-≤15dB (1) | ≤10dB (1) |
|Dauer| 0min (0) | >0-≤5min (0) | >5-≤10min (0) | >10-≤15min (1) | **>15-≤20min (1)** | >20-≤25min (1) | >25-≤30min (1) | >30min (1) |
|Übertragungsrisiko| I (1) | II (2) | III (3) | IV (4) | V (5) | VI (6) | VII (7) | **VIII (8)** |

Tabelle 3: Parameterwerte für Bettys Begegnungsmenge mit Anton am 16. (zutreffende Werte fett)

Da diese Risikobegegnung zugleich die einzige Risikobegegnung ist, die Bettys CWA bekannt ist, wird auch nur sie bei der summarischen Auswertung ihrer Aufenthaltszeiten in den Entfernungsräumen bis 1,5 Meter und bis 3 Meter berücksichtigt.
Betty hielt sich 20 Minuten im Entfernungsraum unter 1,5 Meter auf, die zur Gänze gezählt werden.

Auch bei der Verrechnung dieser 20 Minuten mit dem Begegnungsrisiko der Risikobegegnung mit dem höchsten Risiko kann wieder nur diese eine Risikobegegnung mit ihrem Begegnungsrisiko von 40 berücksichtigt werden.
Die Multiplikation der 20 Minuten mit 40/25 (25 ist der aktuell konfigurierte Wert für "durchschnittlich riskante" Risikobegegnungen; s.a. *risk-score-normalization-divisor* in "Konfiguration von Dämpfung & Dauer" im Abschnitt "Aktuelle Konfiguration") ergibt 32 Minuten.
Da die CWA ab 15 Minuten über ein erhöhtes Risiko benachrichtigt, erhält Betty nun eine solche Benachrichtigung.
Zugleich wird ihr mitgeteilt, dass sie eine Risikobegegnung hatte und diese 5 Tage zurückliegt.

Am folgenden Tag, dem 22., ruft Bettys CWA auch Aishas Positivkennungen ab.
Sie erkennt zusätzliche Begegnungen am 16. und am 9. des Monats.
Beide Begegnungsmengen haben insgesamt jeweils 20 Minuten gedauert und die Smartphones waren im Durchschnitt zwei Meter voneinander entfernt.
Auch hieraus ergeben sich Werte von jeweils 1 für die Dauer und die Dämpfung.
Die Verzugsrisikowerte (22 - 16 = 6 Tage; 22 - 9 = 13 Tage) sind konstant 5 und die Übertragungsrisikowerte 5 für den 16. und 1 für den 9. des Monats.

Die Begegnungsrisiken berechnen sich für den 16. also als 1 x 1 x 5 x 5 = 25 und für den 9. als 1 x 1 x 5 x 1 = 5.
Die Begegnungsmenge des 9. erreicht den Grenzwert nicht und zählt damit nicht als Risikobegegnung.

|| | | | | | | | |
|-|-|-|-|-|-|-|-|-|
|Verzugsrisiko| ≥14d (5) | 12-13d (5) | 10-11d (5) | 8-9d (5) | **6-7d (5)** | 4-5d (5) | 2-3d (5) | 0-1d (5) |
|Dämpfung| >73dB (0) | >63-≤73dB (1) | **>51-≤63dB (1)** | >33-≤51dB (1) | >27-≤33dB (1) | >15-≤27dB (1) | >10-≤15dB (1) | ≤10dB (1) |
|Dauer| 0min (0) | >0-≤5min (0) | >5-≤10min (0) | >10-≤15min (1) | **>15-≤20min (1)** | >20-≤25min (1) | >25-≤30min (1) | >30min (1) |
|Übertragungsrisiko| I (1) | II (2) | III (3) | IV (4) | **V (5)** | VI (6) | VII (7) | VIII (8) |

Tabelle 4: Parameterwerte für Bettys Begegnungsmenge mit Aisha am 16. (zutreffende Werte fett)

|| | | | | | | | |
|-|-|-|-|-|-|-|-|-|
|Verzugsrisiko| ≥14d (5) | **12-13d (5)** | 10-11d (5) | 8-9d (5) | 6-7d (5) | 4-5d (5) | 2-3d (5) | 0-1d (5) |
|Dämpfung| >73dB (0) | >63-≤73dB (1) | **>51-≤63dB (1)** | >33-≤51dB (1) | >27-≤33dB (1) | >15-≤27dB (1) | >10-≤15dB (1) | ≤10dB (1) |
|Dauer| 0min (0) | >0-≤5min (0) | >5-≤10min (0) | >10-≤15min (1) | **>15-≤20min (1)** | >20-≤25min (1) | >25-≤30min (1) | >30min (1) |
|Übertragungsrisiko| **I (1)** | II (2) | III (3) | IV (4) | V (5) | VI (6) | VII (7) | VIII (8) |

Tabelle 5: Parameterwerte für Bettys Begegnungsmenge mit Aisha am 9. (zutreffende Werte fett)

Die Risikobegegnung des 16. wird hingegen bei der aktualisierten summarischen Auswertung mit berücksichtigt, so dass Bettys CWA nun 20 Minuten (mit Anton) im Entfernungsraum bis 1,5 Metern ganz und weitere 20 Minuten (mit Aisha) im Entfernungsraum bis 3 Meter zur Hälfte (also als 10 Minuten) zählt.
Die so ermittelten 30 Minuten werden wieder mit Bettys Risikobegegnung mit Anton verrechnet, die mit 40 nach wie vor das höchste Begegnungsrisiko aller erkannten Risikobegegnungen des aufgezeichneten 14-Tage-Zeitraums hat, so dass sich 30 x 40/25 = 48 Minuten ergeben.

Bettys aktualisierte Risikobenachrichtigung zeigt jetzt 2 Risikobegegnungen an, von denen die letzte 6 Tage zurückliegt.

## Aktuelle Konfiguration

Wie im [Abschnitt "*Risk Calculation*"](../solution_architecture.md#risk-calculation) des *Solution-Architecture*-Dokuments beschrieben, werden die jeweiligen Parameter für die Berechnung aus von einer Menge an Parametern bestimmt, die vom CWA-Server zur Verfügung gestellt werden.
Diese Konfiguration kann sich über die Zeit auf Basis neuer Forschungsergebnisse und Erkenntnisse ändern.
Die jeweils aktuell gültigen Parameterwerte können im [*CWA-Server-Repository*](https://github.com/corona-warn-app/cwa-server) eingesehen werden:

- [Konfiguration von Begegnungen](https://github.com/corona-warn-app/cwa-server/blob/master/services/distribution/src/main/resources/main-config/exposure-config.yaml)
- [Konfiguration von Dämpfung & Dauer](https://github.com/corona-warn-app/cwa-server/blob/master/services/distribution/src/main/resources/main-config/attenuation-duration.yaml)
- [App-Konfiguration, inkl. des minimalen Risikowerts](https://github.com/corona-warn-app/cwa-server/blob/master/services/distribution/src/main/resources/main-config/app-config.yaml)
- [Risikowertklassifizierung](https://github.com/corona-warn-app/cwa-server/blob/master/services/distribution/src/main/resources/main-config/risk-score-classification.yaml)
