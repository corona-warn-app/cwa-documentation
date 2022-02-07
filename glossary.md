# Glossary

This overview provides a description for all acronyms and special terms which are used in the Corona-Warn-App repositories. If you encounter any missing terms, please [let us know](https://github.com/corona-warn-app/cwa-documentation/issues/new?labels=documentation%2C+bug&template=01_doc_issue.md) or [create a pull request](https://github.com/corona-warn-app/cwa-documentation/pulls).

| Term, acronym... | Description |
| --- | --- |
| AEM | Acronym for "[Associated Encrypted Metadata](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ExposureNotification-BluetoothSpecificationv1.2.pdf)". A privacy preserving encrypted metadata that shall be used to carry protocol versioning and transmit (Tx) power for better distance approximation. The Associated Encrypted Metadata changes about every 15 minutes, at the same cadence as the Rolling Proximity Identifier, to prevent wireless tracking of the device.  |
| AES | Acronym for "[Advanced Encryption Standard](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard)", used in the [Exposure Notification Framework](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ExposureNotification-CryptographySpecificationv1.2.pdf) |
| API | An [Application Programming Interface](https://en.wikipedia.org/wiki/Application_programming_interface) (API) is a computing interface which defines interactions between multiple software intermediaries. |
| APNs | Acronym for "[Apple Push Notification service](https://en.wikipedia.org/wiki/Apple_Push_Notification_service)", a platform notification service created by Apple Inc. |
| BGG | The [German Equality of Persons with Disabilities Act](https://www.gesetze-im-internet.de/bgg/), acronym for "Behindertengleichstellungsgesetz", long term: "Gesetz zur Gleichstellung von Menschen mit Behinderungen". |
| BLE, BTLE | [Bluetooth Low Energy](https://en.wikipedia.org/wiki/Bluetooth_Low_Energy) is a wireless personal area network technology. It is used in the Corona-Warn-App. |
| BMG | German [Federal Ministry of Health](https://www.bundesgesundheitsministerium.de/en/), acronym for "Bundesministerium für Gesundheit". |
| CDN | Acronym for [Content Delivery Network](https://en.wikipedia.org/wiki/Content_delivery_network). |
| COVID-19 | [Coronavirus disease 2019](https://en.wikipedia.org/wiki/Coronavirus_disease_2019) is an infectious disease caused by severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2). |
| CTR | Acronym for "[Counter (Mode)](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#CTR)", a mode of operation in cryptography, also used in the [Exposure Notification Framework](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ExposureNotification-CryptographySpecificationv1.2.pdf) |
| CWA | The [Corona-Warn-App](https://github.com/corona-warn-app/cwa-documentation), the official COVID-19 exposure notification app for Germany. |
| Diagnosis Key(s) | The subset of Temporary Exposure Keys uploaded when the device owner is diagnosed as positive for the coronavirus. See also the [Exposure Notification Bluetooth Specification](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ExposureNotification-BluetoothSpecificationv1.2.pdf) |
| DP-3T | [Decentralized Privacy-Preserving Proximity Tracing](https://github.com/DP-3T/documents), another approach to an exposure notification app, mainly driven by institutions from Switzerland. |
| ENA | Acronym for "Exposure Notification App", used as internal identifier for the Corona-Warn-App in certain locations. |
| FAQ | Frequently Asked Questions |
| FCM | Acronym for "[Firebase Cloud Messaging](https://en.wikipedia.org/wiki/Firebase_Cloud_Messaging)", a cross-platform cloud solution for messages and notifications. |
| GUID | Acronym for "[Globally Unique Identifier](https://en.wikipedia.org/wiki/Universally_unique_identifier)". |
| IfSG | The [German Prevention and Control Act of infectious diseases among humans](https://www.gesetze-im-internet.de/ifsg/index.html), acronym for "Infektionsschutzgesetz", long term: "Gesetz zur Verhütung und Bekämpfung von Infektionskrankheiten beim Menschen". |
| OTC | Acronym for "[Open Telekom Cloud](https://open-telekom-cloud.com/)"
| PEPP-PT | [Pan-European Privacy-Preserving Proximity Tracing](https://github.com/pepp-pt/pepp-pt-documentation), formerly endorsed approach to a COVID-19 exposure notification app for Germany. |
| QR Code | Acronym for [Quick Response Code](https://en.wikipedia.org/wiki/QR_code), a two-dimensional/matrix barcode used in the Corona-Warn-App, handed out by the test center after a test was conducted. See our [solution architecture document](solution_architecture.md) for details. |
| Registration Token | Used to a) link the mobile phone with the data from the QR Code and b) generate a TAN which is needed to finally perform the upload of the diagnosis keys to the Corona-Warn-App-Server. See our [solution architecture document](solution_architecture.md) for details. |
| REST | Acronym for "[Representational State Transfer](https://en.wikipedia.org/wiki/Representational_state_transfer)". |
| Risk score | Several parameters are used to calculate a risk score, i.e. the likelihood that a user has been exposed to the coronavirus. See our [solution architecture document](solution_architecture.md) for details. |
| RKI | The [Robert Koch-Institut](https://www.rki.de/) is Germany’s public health institute. |
| RPI | Acronym for "[Rolling Proximity Identifier](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ExposureNotification-BluetoothSpecificationv1.2.pdf)". A privacy preserving identifier derived from the Temporary Exposure Key and sent in the broadcast of the Bluetooth payload. The identifier changes about every 15 minutes to prevent wireless tracking of the device. |
| SARS-CoV-2 | [Severe acute respiratory syndrome coronavirus 2](https://en.wikipedia.org/wiki/Severe_acute_respiratory_syndrome_coronavirus_2) (SARS-CoV-2) is the strain of coronavirus that causes coronavirus disease 2019 (COVID-19), a respiratory illness. It is colloquially known as coronavirus. |
| TAN | Acronym for "[Transaction Authentication Number](https://en.wikipedia.org/wiki/Transaction_authentication_number)". Needed to ensure that a device is allowed to do the upload of the diagnosis keys. TANs are not visible to users. See our [solution architecture document](solution_architecture.md) for details. |
| TAM | Acronym for "[Technical Architecture Modeling](http://www.fmc-modeling.org/fmc-and-tam)", a modeling language mainly used at SAP to describe software architectures.
| TCN | The [TCN Coalition](https://tcn-coalition.org/) is a global community of people to support exposure notification apps during the COVID-19 pandemic. |
| TEK | Acronym for "[Temporary Exposure Key](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ExposureNotification-BluetoothSpecificationv1.2.pdf)". A key that’s generated every 24 hours for privacy consideration. |
| teleTAN | Authorizes the upload of diagnosis keys from the app to the Corona-Warn-App Server if the test has returned a positive result and if the device wasn't linked using the QR Code. If the authorization is successful, the server will issue a registration token. See our [solution architecture document](solution_architecture.md) for details. |

## Other Glossaries

### Technical FAQ Site

- [English Glossary](https://www.coronawarn.app/en/faq/#glossary)
- [German Glossar](https://www.coronawarn.app/de/faq/#glossary)

### Federal Government (Bundesregierung) FAQ Site

To access the glossaries, scroll down the page to the Glossary / Glossar section:

<!-- markdown-link-check-disable -->
<!-- avoids HTTP 503 error due to security measures of https://www.bundesregierung.de -->
- [English FAQs](https://www.bundesregierung.de/corona-warn-app-faq-englisch)
- [German FAQs](https://www.bundesregierung.de/corona-warn-app-faq)
<!-- markdown-link-check-enable -->
