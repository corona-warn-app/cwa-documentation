# Corona-Warn-App

HINWEIS: Die neueste Version der README-Datei ist auch [auf Englisch](../README.md) verfügbar. Bitte haben Sie dafür Verständnis, dass die deutsche Version möglicherweise nicht durchgängig auf dem neuesten Stand ist.

## Über dieses Projekt
Wir entwickeln die offizielle COVID-19-App zur Kontaktfallbenachrichtigung für Deutschland, die sogenannte "Corona-Warn-App". Dieses Projekt hat zum Ziel, eine Anwendung auf der Grundlage einer Technologie mit einem dezentralisierten Ansatz zu entwickeln. Als Grundlage dienen die Protokolle [DP-3T](https://github.com/DP-3T/documents) (Decentralized Privacy-Preserving Proximity Tracing) und [TCN](https://tcn-coalition.org/) und die Spezifikationen für [Privacy-Preserving Contact Tracing](https://www.apple.com/covid19/contacttracing/) von Apple und Google. Wie DP-3T und TCN folgen auch die Apps und die Backend-Infrastruktur dem Open-Source-Prinzip - lizenziert unter [Apache 2.0 ](../LICENSE)! Die Apps (für iOS und Android) werden pseudonymisierte Daten von Mobiltelefonen in der Umgebung mit Hilfe von Bluetooth-Technologie sammeln. Die Daten werden lokal auf den einzelnen Geräten gespeichert, um so den Zugriff auf die Daten und die Kontrolle über die Daten durch Behörden oder andere Instanzen zu verhindern. Wir erfüllen die geltenden Datenschutzvorgaben und garantieren höchste IT-Sicherheitsstandards. Auf diese Weise stellen wir uns den Datenschutzbedenken der Bevölkerung und hoffen dadurch, die Nutzung der Anwendung zu steigern.

## Wer Wir Sind

Die deutsche Regierung hat SAP und die Deutsche Telekom beauftragt, die Corona-Warn-App für Deutschland als Open-Source-Software zu entwickeln. Deutsche Telekom stellt das Netzwerk und die Mobiltechnologie zur Verfügung und wird für den sicheren, skalierbaren und stabilen Betrieb des Backends der App sorgen. SAP entwickelt die App, das zugehörige Framework und die zugrundeliegende Plattform. Das bedeutet also, dass Entwicklungsteams sowohl von SAP als auch von Deutsche Telekom zu diesem Projekt beitragen. Open Source bedeutet in diesem Fall, dass wir es allen Interessierten ermöglichen und sie sogar dazu ermutigen, an dem Projekt teilzunehmen und Teil der Entwickler:innen-Community zu werden.

## Danksagungen

Wir möchten allen Partner:innen danken, die an diesem wichtigen Projekt gleich von Beginn an beteiligt waren. Wir wären nicht da, wo wir heute sind, wenn die Partner:innen auf europäischer und nationaler Ebene nicht bereits so große Fortschritte mit [PEPP-PT](https://www.pepp-pt.org/) erzielt hätten. Wir setzen auf einigen dieser Komponenten auf und sind sehr dankbar dafür, mit wie viel Einsatz sich alle Beteiligten für den Erfolg dieses neuen Ansatzes einsetzen. Darüber hinaus bedanken wir uns bei GitHub für die großartige Unterstützung.

## Datenschutz

In diesem Projekt berücksichtigen wir die Prinzipien der Datenschutzgrundverordnung (DSGVO), um die Privatsphäre der Nutzer:innen zu schützen. Wir verarbeiten ausschließlich notwendige Daten - ausschließlich zu dem Zweck, die Nutzer:innen wissen zu lassen, ob sie in engem Kontakt mit anderen, bereits infizierten Nutzern:innen standen - ohne die jeweilige Identität zu offenbaren. Die Einhaltung dieser Grundsätze wird durch verschiedene Schritte sichergestellt, zum Beispiel durch die Implementierung technischer und organisatorischer Maßnahmen, die sich sorgfältig an die hohen Standards der DSGVO halten. Selbstverständlich wird die Anwendung für die Nutzer:innen eine verständliche Datenschutzerklärung vorhalten, um so transparent und klar wie möglich zu sein. Da wir die Anwendung als Open Source-Projekt entwickeln, kann die Community dies überprüfen. Wir begrüßen Ihre Rückmeldungen!

## Arbeitssprache

Wir entwickeln diese Anwendung für Deutschland. Wir möchten so offen und transparent wie möglich sein, auch für Interessierte in der globalen Entwickler:innen-Community, die nicht Deutsch sprechen. Daher wird sämtlicher Inhalt vor allem auf _Englisch_ zur Verfügung gestellt. Wir bitten auch alle Interessierten, Englisch als Arbeitssprache zu verwenden, etwa für Entwickler:innenkommentare im Code, für die Dokumentation oder wenn Sie uns Anfragen senden. Die Anwendung selbst, die zugehörige Dokumentation und sämtlicher Inhalt für die Endanwender:innen werden selbstverständlich auf Deutsch (und möglicherweise auch andere Sprachen) zur Verfügung gestellt. Wir werden auch versuchen, Entwickler:innendokumentation auf Deutsch zur Verfügung zu stellen, aber wir bitten um Verständnis dafür, dass es nur mit Englisch als der _Lingua Franca_ der globalen Entwickler:innen-Community möglich sein wird, bei der Entwicklung dieser Anwendung mit höchstmöglicher Effizienz zu arbeiten.

## Unsere Dokumentation

Dieses Repository enthält die Entwickler:innendokumentation und zugehörige Inhalte.

### Projektumfang (Scoping-Dokument)
Der Projektumfang wurde gemeinsam von der Deutschen Telekom AG sowie der SAP SE als Auftragnehmer und der deutschen Bundesregierung sowie dem Robert-Koch-Institut als Auftraggeber festgelegt. Der Projektumfang könnte sich im Laufe der Zeit ändern, wenn neue Anforderungen einbezogen werden müssen oder wenn sich bestehende Anforderungen ändern. Wir begrüßen Rückmeldungen zu allen Bestandteilen dieses Dokuments zum Projektumfang. Allerdings müssen zusätzliche Funktionen oder andere inhaltliche Änderungen, die über das Beheben von Grammatik- oder Schreibfehlern hinausgehen, zwischen den Partnern abgestimmt werden bevor sie in das Dokument aufgenommen werden können. Vielen Dank für Ihr Verständnis!
- [Corona-Warn-App - Scoping-Dokument](scoping_document.de.md)

## Lizenzierung

Copyright (c) 2020 Deutsche Telekom AG und SAP SE oder ein SAP-Konzernunternehmen.

Lizenziert unter **Apache-Lizenz, Version 2.0** (die "Lizenz"). Sie dürfen diese Datei ausschließlich im Einklang mit der Lizenz verwenden.

Eine Kopie der Lizenz erhalten Sie unter https://www.apache.org/licenses/LICENSE-2.0.

Sofern nicht durch anwendbares Recht gefordert oder schriftlich vereinbart, wird jede unter der Lizenz bereitgestellte Software „OHNE MÄNGELGEWÄHR“ UND OHNE AUSDRÜCKLICHE ODER STILLSCHWEIGENDE GARANTIE JEGLICHER ART bereitgestellt. Die genauen Angaben zu Genehmigungen und Einschränkungen unter der Lizenz finden Sie in der [LIZENZ](../LICENSE).

## Informationen zur Teilnahme

Weitere Informationen z.B. darüber, wie man das Projekt unterstützen kann, unser Team aufgebaut ist oder unsere Projektstruktur aussieht, finden Sie hier: [CONTRIBUTING.md](../CONTRIBUTING.md).
