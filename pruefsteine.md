# Criteria for the Evaluation of Contact Tracing Apps

The Chaos Computer Club (CCC) proposed minimum privacy [requirements](https://www.ccc.de/en/updates/2020/contact-tracing-requirements) that should be considered when designing and evaluating contact tracing apps.

The CCC is a well-reputed European hacker collective dealing with ["technical and societal issues, such as surveillance, privacy, freedom of information, hacktivism, data security, and many other interesting things around technology and hacking issues."](https://www.ccc.de/en)

This document describes the compliance of the [current architecture](https://github.com/corona-warn-app/cwa-documentation/blob/master/solution_architecture.md) of the Corona-Warn-App with the *technical* criteria as outlined in the CCC's contact tracing requirements. For *political* and *epidemiological* criteria, we refer to the German Ministry of Health or the Robert-Koch-Institute, respectively.

We are confident that the concept of the Corona-Warn-App is compliant with the CCC's technical requirements. We invite all members of the public to assess the ongoing implementation and discuss any issues or concerns [directly in the development repositories](https://github.com/corona-warn-app) in an open and transparent manner.

## No Central Entity to Trust

The Corona-Warn-App server does not store or process any confidential information requiring trust or secrecy. Due to the decentralized approach, the server does not hold any secret information. All the information that is stored on the server is publicly available.

Based on this publicly available data and the information that is securely stored on the end device, the app itself, and not a cloud service, decides whether to inform a user about a potential exposure event. This information never leaves the device.

The information about individual potential exposure events is not stored in the app itself, but handled securely by the underlying exposure notification framework. This framework stores information about visible rolling proximity identifiers (RPI) that were in close proximity over a defined time interval. This information is stored directly on the device.

Even if the central Corona-Warn-App server is compromised, this information cannot be linked back to devices without having access to the device in the first place. Even then, the app itself cannot access the RPIs. Access to the diagnosis keys is only possible with the user's consent and only for a short period of time. Information that links diagnosis keys and connection metadata is removed before processing this data. Furthermore, identifying metadata, such as the IP address, is removed before diagnosis keys are processed by the backend server to further reduce the risk of rogue individuals connecting this information.

## Data Economy/Minimization

As mandated by the General Data Protection Regulation (GDPR), [data minimization](https://www.privacy-regulation.eu/en/article-5-principles-relating-to-processing-of-personal-data-GDPR.htm) is a paramount principle in the implementation of the Corona-Warn-App.

Data collection is limited to the minimum data required for the app to function. Users only provide the following input: 

 * Permission to use the Exposure Notification framework
 * QR Code scan during testing
 * TeleTAN in case of hotline-based result verification
 * Consent to upload daily diagnosis keys
 
Location data is not and cannot be collected by apps using the Exposure Notification framework:

* [Section 3.3 Exposure Notification APIs Addendum](https://developer.apple.com/contact/request/download/Exposure_Notification_Addendum.pdf)
* [Section 3.c Google COVID-19 Exposure Notifications Service Additional Terms](https://blog.google/documents/72/Exposure_Notifications_Service_Additional_Terms.pdf). 

The diagnosis keys are only stored centrally for the epidemiologically relevant period of 14 days and are removed automatically after that period. 

## Anonymity

Users remain anonymous within the Corona-Warn-App system as long as their temporary exposure keys (TEK) solely remain on their device.

The rolling proximity identifiers (RPI) that are observed by other devices can only be verified via the uploaded TEKs. RPIs also change frequently, i.e. in 10-20 min intervals, based on the TEK and the TEK changes daily. This means that even if the list of RPIs for a given day is available, it would still not be possible to identify a person that is sitting next to you every day in public transport.

Theoretically, it would be possible to follow a user, collect the user's RPIs, connect them with person-identifying data, and then check if the person is ever marked as infected. Yet, in practice, this attack vector to deanonymize a user requires a high amount of effort just to gain little additional information compared to the one already gathered while following the user.

Once temporary exposure keys are uploaded to the server (in case of a positive test result), anonymity turns into pseudonymity. With the uploaded diagnosis keys available, it becomes possible to attribute all RPIs of a given day to a single diagnosis key. Attributing this diagnosis key to distinct users or their device's International Mobile Equipment Identity (IMEI) is, however, still not possible without having direct access to the secret storage of the device.

Users only have to identify themselves when they obtain the permission to upload diagnosis keys via teleTAN. But this happens just for verification reasons and should not provide identifying information beyond the one already known to health authorities. To further increase anonymity, users can make the call using a different device than the device they use for exposure detection.

## No Creation of Central Movement or Contact Profiles

Movement or contact data is not collected centrally. 

Neither location data, nor the rolling proximity identifiers that are part of potential exposure events are ever stored centrally. At any given point in time, the system is only aware that diagnosis keys belong to individuals that have tested positive, not whom they met, where they met, or when they met. 

To use the app for exposure detection, no identification is required. An identification is only necessary for the results retrieval and diagnosis key transmission functions. Linking the app to social media profiles is not and will not be implemented in this project.

## Unlinkability

The Corona-Warn-App and the underlying Exposure Notification framework take necessary cryptographic and technical means to prevent linking of user identity and the keys and identifiers visible in the system.

Temporary Exposure Keys (TEK) are newly generated every day only on the user's device. From these TEKs, rolling proximity identifiers (RPI) are generated in 10 to 20 minute intervals. Without TEKs being uploaded and, thus, becoming diagnosis keys, RPIs cannot be linked to a certain user. If diagnosis keys have been uploaded, linking becomes only possible between diagnosis key and RPI and not directly to a user.

As a rare edge case, diagnosis keys could be attributed to a single person in case this person is the only one reporting positive for a prolonged period of time. By only publishing diagnosis keys once a certain threshold of submissions is reached over a period of time, this risk is mitigated. Also, diagnosis key upload is limited for the last 14 days prior to the positive test results and no linking of exposure events beyond the epidemiological relevant timeframe is possible.

## Unobservability of Communication

The Corona-Warn-App takes state of the art measures to make individual messages and communication patterns unobservable to malicious entities.

Well-established encryption mechanisms such as HTTP over TLS (HTTPS) ensure that messages are not readable for outside viewers. Metadata is removed before processing payload in diagnosis key submissions and can therefore not be linked to them on a database level. To further reduce the possibility of man-in-the-middle attacks, certificate pinning shall ensure that trusted communication only happens between the Corona-Warn-App and the server.

Besides shielding individual messages that are transmitted by the system, also communication patterns  need to be disguised. Consider, for example, that polling for test results and submitting diagnosis keys would only happen in case of a real infection. In this case, observing network traffic would be sufficient to know that users took a SARS-CoV-2 test and had a positive result. This attack surface is mitigated by random fake messages that are indistinguishable from valid ones. This way, key submission and the retrieval of test results are indistinguishable from the system's background noise, creating plausible deniability for users even if network traffic is observed. 
