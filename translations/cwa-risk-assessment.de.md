# Wie ermittelt die Corona-Warn-App ein erhöhtes Risiko?

## Voraussetzungen

Personen, die die Corona-Warn-App (CWA) nutzen und positiv auf das Coronavirus SARS-CoV-2 getestet wurden, können ihrer CWA erlauben, die vom Betriebssystem ihres Smartphones erzeugten zufälligen Geräteschlüssel (*Temporary Exposure Keys*) der vergangenen Tage als sogenannte Positivkennungen (*Diagnosis Keys*) auf den Corona-Warn-App-Server hochzuladen und dort zu veröffentlichen. Diese Positivkennungen sind die Grundlage der Risikoermittlung für alle anderen die CWA nutzenden Personen.

Eine Corona-positiv getestete Person lädt bis zu 15 Positivkennungen hoch, nämlich je eine für jeden der bis zu 14 letzten Tage vor dem Hochladen sowie am folgenden Tag die für den aktuellen Tag. Letzteres ist nötig, da Positivkennungen nur für bereits vergangene Tage hochgeladen werden können.

Positivkennungen lassen keine Rückschlüsse auf die Identität der positiv getesteten Person zu, aber die Positivkennung eines bestimmten Tages passt zu den ständig wechselnden Zufallscodes (*Rolling Proximity Identifiers*), die das Smartphone der Person den ganzen Tag über mittels Bluetooth versendet hat und die von den Smartphones in der Nähe empfangen und aufgezeichnet wurden. An jede Positivkennung ist noch ein Wert angehängt, der angibt, wie groß das Übertragungsrisiko (*Transmission Risk Level*) der positiv getesteten Person an dem Tag, zu dem die Positivkennung gehört, vermutlich gewesen ist. Dieses Übertragungsrisiko wird anhand von Erfahrungswerten unter Berücksichtigung der aktuell vorliegenden wissenschaftlichen Erkenntnisse in einem komplizierten Verfahren geschätzt. Jede Positivkennung verfällt, wenn sie älter als 14 Tage ist. Deshalb sind stets nur die Positivkennungen der letzten 14 Tage verfügbar.

## Verfahren

Alle aktiven Corona-Warn-Apps laden täglich vom Corona-Warn-App-Server die dort veröffentlichten Positivkennungen herunter und übergeben sie gesammelt über eine Schnittstelle an das Betriebssystem. Dort wird geprüft, ob empfangene und aufgezeichnete Zufallscodes vorliegen, die zu einer der Positivkennungen passen. Ein solches Zusammenpassen zeigt an, dass sich das Smartphone, das die Zufallscodes aufgezeichnet hat, und das Smartphone der Corona-positiv getesteten Person, die die Positivkennung hochgeladen hat, an dem Tag, zu dem die Positivkennung gehört, begegnet sind.

Als nächstes wird für jede Positivkennung anhand aller dazu passenden Zufallscodes geschätzt, wie lange die Begegnungen jenes Tags insgesamt gedauert haben und wie nahe die Smartphones sich dabei im Durchschnitt waren. Die Entfernung wird aus der gemessenen Abschwächung des Bluetooth-Signals errechnet, die in dB (Dezibel) angegeben wird. Jedem dB-Wert lässt sich eine Entfernung im Freiraum (d.h., ohne Hindernisse im Signalweg; s.a. Erläuterungen im Abschnitt "Folgen und Einschränkungen") zuordnen. Alle Begegnungen zu einer Positivkennung, die insgesamt weniger als 10 Minuten gedauert haben (egal, wie nahe sich die Smartphones dabei gekommen sind) oder bei denen die Smartphones im Durchschnitt mehr als ca. 8 Meter Freiraum (73 dB Dämpfung) voneinander entfernt waren (egal, wie lange sie insgesamt gedauert haben), werden als unbedenklich verworfen.

> NB: Wir bezeichnen die Gesamtheit aller Begegnungen, die jeweils zu einer Positivkennung gehören, also alle Begegnungen eines Tages zwischen denselben zwei Smartphones, im Weiteren als Begegnungsmenge.

Bei den restlichen, nicht als unbedenklich verworfen Begegnungen wird für jede Begegnungsmenge ein Begegnungsrisiko (*Total Risk Score*) errechnet, indem der oben erläuterte Übertragungsrisikowert mit einem Verzugsrisikowert (*Days Since Last Exposure Value*) multipliziert wird, der sich aus der Anzahl der seit der Begegnung vergangenen Tage ableitet.

Alle Begegnungsmengen, die dabei einen bestimmten Grenzwert (*Minimum Risk Score*) überschreiten, werden als Risikobegegnungen angesehen. Die anderen Begegnungsmengen werden ebenso wie zuvor schon die zu kurzen oder zu entfernten Begegnungsmengen als unbedenklich verworfen.

Zugleich wird für alle verbleibenden Begegnungsmengen, die Risikobegegnungen, zusammengezählt, wieviel Zeit in einem sehr nahen Entfernungsbereich unter ca. 1,5 Metern (55 dB Dämpfung) verbracht wurde und wieviel Zeit in einem nahen Entfernungsbereich zwischen ca. 1,5 und 3 Metern (63 dB Dämpfung) verbracht wurde. Dabei wird die Zeit im sehr nahen Bereich ganz und die Zeit im nahen Bereich zur Hälfte gezählt.

Die so errechnete Gesamtzeit wird dann noch mit dem Begegnungsrisiko der Risikobegegnung mit dem höchsten Risiko (*Maximum Risk Score*) verrechnet. Und zwar so, dass sie unverändert bleibt, wenn dieses Risiko als durchschnittlich (für Risikobegegnungen) eingeschätzt wird, dass sie sich bis auf das ungefähr anderthalbfache verlängert, wenn dieses Risiko überdurchschnittlich ist, und deutlich (bis auf ungefähr ein Sechstel) verkürzt, wenn dieses Risiko unterdurchschnittlich ist. Dadurch kann eine Zeit, die zuvor 10 Minuten betrug, auf über 15 Minuten verlängert werden und eine Zeit, die zuvor 45 Minuten betrug, auf unter 10 Minuten verkürzt werden.

## Folgen und Einschränkungen

Am Ende wird die die CWA nutzende Person immer dann über ein erhöhtes Risiko benachrichtigt, wenn die so ermittelte gesamte Risikobegegnungszeit 15 Minuten oder länger ist. Diese Benachrichtigung erfolgt in der CWA und gibt der Person zugleich Handlungsempfehlungen für das weitere Vorgehen.

Bei der Bewertung der von der CWA ermittelten Zeiten und Entfernungen muss berücksichtigt werden, dass beide Parameter nicht exakt gemessen werden können. Die einzelnen gemessenen Zeiten können bis zu 5 Minuten in beide Richtungen abweichen und die ermittelten Entfernungen sind Näherungswerte unter Idealbedingungen, d.h., wenn z.B. keine Hindernisse zwischen den beiden Smartphones sind. Schon bei kleineren Hindernissen, z.B. einer Person zwischen den beiden Smartphones oder wenn das Smartphone abgeschirmt verstaut ist, kann die Entfernung doppelt so groß erscheinen wie sie wirklich ist.

Aufgrund von Datenschutzerwägungen können die oben beschriebenen Eigenschaften an der Schnittstelle zum Betriebssystem vorerst nur für die Gesamtheit aller Risikobegegnungen abgefragt werden, nicht aber für einzelne Risikobegegnungen oder tageweise. Solange die Anzahl neuer Fälle vergleichsweise gering bleibt, dürfte das keinen großen Unterschied machen, da vermutlich nur wenige die CWA nutzende Personen im Zeitraum vor ihrer Benachrichtigung Risikobegegnungen mit mehreren positiv getesteten Personen haben, die die CWA nutzen.

## Aktuelle Konfiguration

Wie im [Abschnitt 'Risk Score Calculation'](https://github.com/corona-warn-app/cwa-documentation/blob/master/solution_architecture.md#risk-score-calculation) des Solution-Architecture-Dokuments beschrieben, werden die jeweilgen Parameter für die Berechnung von einer Menge an Parametern bestimmt, die von cwa-server zur Verfügung gestellt werden. Diese Konfiguration kann sich über die Zeit auf Basis der jüngsten Forschungsergebnisse ändern. Die jeweils aktuell gültigen Parameterwerte können im [cwa-server-Repository](https://github.com/corona-warn-app/cwa-server) eingesehen werden:

- [Konfiguration von Begegnungen](https://github.com/corona-warn-app/cwa-server/blob/master/services/distribution/src/main/resources/master-config/exposure-config.yaml)
- [Konfiguration von Dämpfung & Dauer](https://github.com/corona-warn-app/cwa-server/blob/master/services/distribution/src/main/resources/master-config/attenuation-duration.yaml)
- [App-Konfiguration, inkl. des minimalen Risikowerts](https://github.com/corona-warn-app/cwa-server/blob/master/services/distribution/src/main/resources/master-config/app-config.yaml)
- [Risikowertklassifizierung](https://github.com/corona-warn-app/cwa-server/blob/master/services/distribution/src/main/resources/master-config/risk-score-classification.yaml)