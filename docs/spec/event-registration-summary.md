# Event Registration - Summary

**NB: Draft, supposed to be released on GitHub for an open discussion.**

Presence Tracing - in CWA also referred to as _Event Registration_ - aims at notifying people of a potential SARS-CoV-2 infection if they have been to the same venue at a similar time than a positively tested individual. It addresses the potential of airborne transmission in spaces with poor ventilation despite maintaining physical distance. As such, it complements BLE-based proximity tracing with the Exposure Notification Framework.

CWA proposes a fully-automated decentral solution for Presence Tracing which works independent of local health authorities. It integrates into the existing verification processes of CWA to issue warnings. The solution prioritizes the speed of issuing warnings over their accuracy. A higher degree of accuracy would require manual assessment by local health authorities and the respective resources to do so and is currently not on scope.

In summary, the proposed solution allows a _host_ to create a venue through CWA. All necessary data about the venue is encoded in a QR code which can be presented on a mobile device or printed out, for example to be posted at the entrance of the venue. An _attendee_ can check in to the venue by scanning the QR code. Check-ins are stored locally on the mobile device and deleted automatically after two weeks. 

When an attendee tests positive for SARS-CoV-2, they can upload their check-ins along with their Diagnosis Keys to the CWA Server. The CWA Server publishes the relevant check-ins on CDN as _warnings_. Clients regularly download these warnings and match them against the local check-ins on the mobile device. If there is a match and the time an attendee spent at a venue overlaps with a warning for a sufficiently long time, the attendee receives a warning in CWA similar to how warnings are issued for BLE-based exposures.