# Prüfsteine für die Beurteilung von „Contact Tracing“-Apps

Der Chaos Computer Club (CCC) hat einige [Minimalanforderungen](https://www.ccc.de/updates/2020/contact-tracing-requirements) zur Wahrung der Privatsphäre bei der Konzeption und Bewertung von „Contact Tracing“-Apps vorgeschlagen.

Der CCC ist eine renommierte europäische Hackervereinigung, die sich mit dem [Spannungsfeld technischer und sozialer Entwicklungen](https://www.ccc.de) befasst: „Die Aktivitäten des Clubs reichen von technischer Forschung und Erkundung am Rande des Technologieuniversums über Kampagnen, Veranstaltungen, Politikberatung, Pressemitteilungen und Publikationen bis zum Betrieb von Anonymisierungsdiensten und Kommunikationsmitteln.“

Dieses Dokument beschreibt, inwieweit die [aktuelle Architektur](../solution_architecture.md) die *technischen* Anforderungen erfüllt. In Bezug auf die *politischen* und *epidemiologischen* Anforderungen verweisen wir an das deutsche Bundesministerium für Gesundheit bzw. das Robert Koch-Institut.

Wir sind davon überzeugt, dass das Konzept der Corona-Warn-App die technischen Anforderungen des CCC erfüllt. Es sind alle dazu eingeladen, die laufende Implementierung der App zu prüfen und jegliche Probleme, Bedenken oder sonstige Themen offen und transparent [direkt in den Entwicklungs-Repositories](https://github.com/corona-warn-app) zu diskutieren.

## Keine zentrale Entität, der vertraut werden muss

Der Server der Corona-Warn-App speichert und verarbeitet keinerlei vertrauliche Informationen, für die Vertrauenswürdigkeit oder Geheimhaltung erforderlich sind. Aufgrund des dezentralen Ansatzes liegen auf dem Server keine geheimen Informationen – alle gespeicherten Informationen sind öffentlich zugänglich.

Auf Basis dieser öffentlich zugänglichen Daten und den sicher auf dem Endgerät gespeicherten Informationen entscheidet die App – und kein Cloud-Service –, ob eine nutzende Person über ein potenzielles Kontaktereignis informiert wird. Diese Information verlässt das Gerät zu keinem Zeitpunkt.

Die App selbst speichert keine Informationen über einzelne potenzielle Kontaktereignisse. Diese Informationen werden über das zugrunde liegende Exposure Notification Framework sicher verarbeitet. Das Framework speichert lediglich sichtbare Rolling Proximity Identifiers (RPI), die sich über einen bestimmten Zeitraum in nächster Nähe befanden. Auch dies wird direkt auf dem Smartphone gespeichert.

Selbst wenn der zentrale Corona-Warn-App-Server kompromittiert sein sollte, können diese Informationen nicht zu Smartphones zurückverfolgt werden, wenn nicht ohnehin schon Zugriff auf das Smartphone besteht. Auch dann kann die App selbst nicht auf die RPIs zugreifen. Der Zugriff auf die Diagnoseschlüssel ist nur mit Zustimmung der nutzenden Person und nur für einen kurzen Zeitraum möglich. Vor der Verarbeitung der Daten werden die Informationen entfernt, die die Diagnoseschlüssel und die Verbindungsmetadaten miteinander verknüpfen. Metadaten, die eine Identifizierung ermöglichen (z.B. die IP-Adresse), werden entfernt, bevor der Backend-Server Diagnoseschlüssel verarbeitet. Dadurch wird das Risiko weiter verringert, dass ein Angreifer diese Informationen miteinander verknüpfen kann.

## Datensparsamkeit

Wie in der Datenschutz-Grundverordnung (DSGVO) vorgeschrieben, ist die [Datenminimierung](https://www.privacy-regulation.eu/de/5.htm) einer der wichtigsten Grundsätze für die Umsetzung der Corona-Warn-App.

Es werden nur die Daten gesammelt, die für ein Funktionieren der App nötig sind. Die nutzenden Personen können und müssen in Verbindung mit der App ausschließlich die folgenden Angaben machen:

* Zustimmung zur Nutzung des Exposure Notification Frameworks
* Scannen eines QR-Codes mit dem Testergebnis
* Eingabe einer TeleTAN bei der Verifizierung eines Testergebnisses per Hotline
* Zustimmung zum Upload der täglichen Diagnoseschlüssel

Apps können über das Exposure Notification Framework keine Daten zum Standort sammeln:

* [Section 3.3 Exposure Notification APIs Addendum](https://developer.apple.com/contact/request/download/Exposure_Notification_Addendum.pdf)
* [Section 3.c Google COVID-19 Exposure Notifications Service Additional Terms](https://blog.google/documents/72/Exposure_Notifications_Service_Additional_Terms.pdf).

Die Diagnoseschlüssel werden nur für den epidemiologisch relevanten Zeitraum von 14 Tagen zentral gespeichert und nach den 14 Tagen automatisch entfernt.

## Anonymität

Nutzende Personen bleiben innerhalb des Corona-Warn-App-Systems anonym, solange ihre Temporary Exposure Keys (TEK) auf ihrem Smartphone verbleiben.

Die Rolling Proximity Identifiers (RPI), die von anderen Smartphones beobachtet werden, können nur mit diesen hochgeladenen TEKs verifiziert werden. Die RPIs werden häufig (alle 10 bis 20 Minuten) auf Basis des Temporary Exposure Keys geändert, der sich wiederum selbst täglich erneuert. Man könnte also z.B. selbst dann nicht feststellen, dass eine nutzende Person jeden Tag im Bus neben derselben Person gesessen hat, wenn die Liste der RPIs für bestimmte Tage einsehbar wäre.

Theoretisch könnte man einer nutzenden Person folgen, die RPIs der Person sammeln, diese mit bestimmten Informationen verknüpfen, die die Person identifizieren, und dann prüfen, ob die Person jemals als infiziert gemeldet wurde. In der Praxis wäre dieser Angriffsvektor zur Deanonymisierung einer nutzenden Person sehr aufwendig, da der Informationsgewinn verglichen mit dem, was man beim Verfolgen der nutzenden Person ohnehin bereits erfahren hat, sehr gering wäre.

Sobald TEKs (im Falle eines positive Testergebnisses) auf den Server hochgeladen werden, wird aus Anonymität Pseudonymität. Wenn der hochgeladene Diagnoseschlüssel verfügbar ist, können alle RPIs eines bestimmten Tages einem einzelnen Diagnoseschlüssel zugeordnet werden. Es ist jedoch nicht möglich, diesen Diagnoseschlüssel konkreten nutzenden Personen oder der International Mobile Equipment Identity (IMEI) von deren Smartphone zuzuordnen, ohne Zugang zum geheimen Speicher des Geräts zu haben.

Nutzende Personen müssen sich nur identifizieren, wenn sie die Erlaubnis erteilen, dass Diagnoseschlüssel per TeleTAN hochgeladen werden dürfen. Diese Identifizierung dient aber nur der Verifizierung und legt außer den Informationen zur Identifizierung, über die die Gesundheitsbehörden ohnehin schon verfügen, keine weiteren Angaben offen. Um noch mehr Anonymität zu erreichen, könnte eine nutzende Person die Hotline mit einem anderen Telefon anrufen als mit dem, das zur Kontakterkennung verwendet wird.

## Kein Aufbau von zentralen Bewegungs- und Kontaktprofilen

Bewegungs- und Kontaktdaten werden nicht zentral gesammelt.

Weder Standortdaten noch die Rolling Proximity Identifiers, die Bestandteil potenzieller Kontaktereignisse sind, werden jemals zentral gespeichert. Das System weiß zu jedem Zeitpunkt nur, dass ein Diagnoseschlüssel zu einer positiv getesteten Person gehört. Das System weiß weder, wen diese Person getroffen hat, noch wo oder wann es zu dem Kontakt kam.

Damit die App erkennen kann, dass ein Kontakt stattgefunden hat, ist keine Identifizierung notwendig. Eine Identifizierung ist nur erforderlich, um die Ergebnisse abzurufen und den Diagnoseschlüssel zu übermitteln. Die App verbindet sich im Rahmen dieses Projekts nicht mit irgendwelchen Profilen in sozialen Medien und wird dies auch in Zukunft nicht tun.

## Unverkettbarkeit

Die Corona-Warn-App und das zugrunde liegende Exposure Notification Framework sehen die erforderlichen kryptografischen und technischen Mittel vor, um zu verhindern, dass die Identität der nutzenden Person und die im System sichtbaren Schlüssel und IDs miteinander verkettet werden können.

Temporary Exposure Keys (TEK) werden täglich neu und ausschließlich auf dem Gerät der nutzenden Person generiert. Über diese TEKs werden alle 10 bis 20 Minuten Rolling Proximity Identifiers (RPI) erzeugt. Solange die TEKs nicht hochgeladen (und damit zu Diagnoseschlüsseln) werden, können RPIs nicht mit einer bestimmten nutzenden Person verknüpft werden. Wenn die Diagnoseschlüssel hochgeladen wurden, können die Diagnoseschlüssel nur mit RPIs verkettet werden, aber nicht direkt mit einer nutzenden Person.

In einem seltenen Grenzfall könnten Diagnoseschlüssel auf eine Einzelperson zurückführbar sein, und zwar wenn sich diese Person über einen längeren Zeitraum als einzige als positiv getestete Person meldet. Indem Diagnoseschlüssel nur veröffentlicht werden, sobald über eine gewisse Zeit ein bestimmter Schwellenwert erreicht ist, wird dieses Risiko gemindert. Darüber hinaus werden Diagnoseschlüssel nur für die letzten 14 Tage vor dem positiven Testergebnis hochgeladen, sodass eine Verkettung von Kontaktereignissen über den epidemiologisch relevanten Zeitraum hinaus nicht möglich ist.

## Unbeobachtbarkeit der Kommunikation

Die Maßnahmen der Corona-Warn-App, mit denen gewährleistet wird, dass einzelne Nachrichten und Kommunikationsmuster nicht von Angreifern beobachtet werden können, entsprechen dem aktuellen Stand der Technik.

Etablierte Verschlüsselungsmechanismen wie HTTP over TLS (HTTPS) stellen sicher, dass Nachrichten von außen nicht lesbar sind. Die Metadaten werden entfernt, bevor die Nutzdaten bei der Übermittlung von Diagnoseschlüsseln verarbeitet werden. Somit können diese nicht auf Datenbankebene verkettet werden. Um das Risiko von Man-in-the-Middle-Angriffen weiter zu reduzieren, wird durch statisches Public Key Pinning sichergestellt, dass vertrauliche Kommunikation nur zwischen der Corona-Warn-App und dem Server stattfindet.

Neben einzelnen Nachrichten, die vom System übertragen werden, müssen auch Kommunikationsmuster abgeschirmt werden. Beispiel: Der Sendeaufruf von Testergebnissen und die Übermittlung von Diagnoseschlüsseln würde normalerweise nur im Fall einer tatsächlichen Infektion stattfinden. In diesem Fall könnte man durch die Beobachtung des Netzwerkverkehrs erkennen, dass eine nutzende Person einen SARS-CoV-2-Test gemacht hat und positiv getestet wurde. Um dies zu verhindern, werden zufällig generierte unechte Meldungen versendet, die von gültigen Meldungen nicht unterschieden werden können. Dadurch sind die Übermittlung von Schlüsseln und der Abruf von Testergebnissen nicht vom Hintergrundrauschen der Systeme unterscheidbar. Dies führt selbst bei beobachtbarem Netzwerkverkehr zu einer plausiblen Abstreitbarkeit.
