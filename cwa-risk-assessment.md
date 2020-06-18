# How does the Corona-Warn-App identify an increased risk?

## Prerequisites

People who use the Corona-Warn-App (CWA) and are tested positive for the SARS-CoV-2 coronavirus can allow their CWA to upload the random device keys (*temporary exposure keys*) that have been generated on their smartphones in recent days to the Corona-Warn-App server as *diagnosis keys* and release them there. These diagnosis keys are the basis for risk identification for all other CWA users.

A user who has tested positive for coronavirus uploads up to 15 diagnosis keys: one for each of the up to 14 days before the download, as well as one for the current day, which is uploaded the next day. The latter is necessary because diagnosis keys can only be uploaded for past days.

Diagnosis keys do not give any indication as to the identity of a person who has tested positive, but a diagnosis key from a certain day can be matched with the *rolling proximity identifiers* that a user’s smartphone has transmitted via Bluetooth throughout a given day and were received and recorded by other smartphones nearby. Each diagnosis key is appended with a value that indicates the *transmission risk level* that likely existed for the person who has tested positive on the day that the diagnosis key belongs to. This transmission risk is then estimated in a complex procedure, which is based on empirical values and takes the latest scientific findings into account. Every diagnosis key expires after 14 days. Therefore, only the diagnosis keys from the last 14 days are available.

## Procedure

Several times per day, all active Corona-Warn-Apps download the diagnosis keys released on the Corona-Warn-App server and pass them on to the operating system in batches through an interface. The app checks whether any of these received, recorded rolling proximity identifiers match any of the diagnosis keys. If there is a match, this indicates that the user’s smartphone encountered the smartphone of a person who has uploaded a diagnosis key on the day to which the diagnosis key belongs.

In the next step, the app analyzes all the matching rolling proximity identifiers for each diagnosis key, to estimate how long the exposure lasted in total on the day in question and how close the smartphones were to each other on average during the exposure. The distance is calculated from the measured reduction in strength of the Bluetooth signal, which is specified in dBm (decibel-milliwatts). All exposures for a diagnosis key that lasted less than 10 minutes in total (regardless of how close the smartphones came during that time) or during which the smartphones were more than 8 meters (73 dBm) apart on average (regardless of how long the exposure lasted) are discarded as harmless.

> NB: In the following, the total of all exposures that belong to a diagnosis key, that is, all exposures over a day between the same two smartphones, is referred to as the “exposure set”.

For the remaining exposures that have not been discarded as harmless, a *total risk score* is calculated for each exposure set, by multiplying the transmission risk score described above by the *days since last exposure value*, which is calculated as the time between the day of the last exposure and the current day.

All exposure sets that exceed a certain threshold (the *minimum risk score*) are considered to be risk exposures. The other exposure sets are discarded as harmless, like the sets that were previously discarded for being too short and/or too distant.

At the same time, the remaining risk exposures are added together to determine how much time exposure took place within a very close range below 1.5 meters (55 dBm) and how much time exposure took place in a close range between 1.5 and 3 meters (63 dBm).

The total calculated time is then cross- calculated against the *maximum risk score*, the exposure with the highest risk: the time remains unchanged if this risk is estimated as average (for risk exposures), it is extended to one and a half times if the risk is above average, and it is reduced significantly (to around one-sixth) if the risk is below average. As a result, an exposure time of 10 minutes can be extended to more than 15 minutes and an exposure time of 45 minutes can be reduced to less than 10 minutes.

## Consequences and Constraints

In the end, a CWA user is notified of an increased risk whenever the risk exposure time calculated as described above amounts to 15 minutes or longer. This notification takes place in the CWA and, at the same time, provides recommendations as to how the user should proceed.

When assessing the times and distances calculated by the CWA, it is important to consider that it is not possible to measure these two parameters precisely. The individually measured times can deviate from the actual exposure time by 5 minutes plus or minus and the calculated distances are approximate values under ideal conditions, that is, without any impediments between the two smartphones. Even minor impediments, such as a person between the two smartphones or a signal-impeding smartphone case, can cause the distance to appear to be twice as large as it actually is.

Due to privacy considerations, the properties described above can currently only be queried for the total set of all risk exposures at the interface to the operating system, but not for individual risk exposures or exposure by day. As long as the number of new infections remains relatively low, this should not make much of a difference, because it is likely that only very few CWA users will have been exposed to multiple persons who have tested positive within the time frame until they are notified.
