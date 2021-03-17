# Event Registration DRAFT - Summary

Presence Tracing - in CWA also referred to as _Event Registration_ - aims at notifying people of a potential SARS-CoV-2 exposure if they have been to the same venue at a similar time as a positively tested individual. It addresses the potential of airborne transmission in spaces with poor ventilation despite maintaining physical distance. As such, it complements BLE-based proximity tracing with the Exposure Notification Framework.

CWA proposes a fully-automated decentral solution for Presence Tracing which works independent of local health authorities and host of the event. It integrates into the existing verification processes of CWA to issue warnings. The solution prioritizes the speed of issuing warnings over their accuracy. A higher degree of accuracy would require manual assessment by local health authorities and the respective resources to do so and is currently not on scope.

In summary, the proposed solution allows a _host_ to create a venue through CWA. All necessary signed data about the venue is encoded in a QR code which can be presented on a mobile device or printed out, for example to be posted at the entrance of the venue. An _attendee_ can check in to the venue by scanning the QR code. Check-ins are stored locally on the mobile device and deleted automatically after two weeks.

When an attendee tests positive for SARS-CoV-2, they can upload their check-ins along with their Diagnosis Keys to the CWA Server. The CWA Server publishes the relevant check-ins on CDN as _warnings_. Clients regularly download these warnings and match them against the local check-ins on the mobile device. If there is a match and the time an attendee spent at a venue overlaps with a warning for a sufficiently long time, the attendee receives a warning in CWA similar to how warnings are issued for BLE-based exposures.

![TAM Diagram for Event Registration](./images/evreg-tam-block.png)

## Threats WiP

Several security and privacy threats have been identified for the proposed solution. This includes common security threats such as distributed denial of service attacks or code injection, which also exist for other CWA components and are mitigated accordingly. It also includes threats specific to Presence Tracing, such as profiling venues and users or issuing false warnings for specific venues. These threats are described below along with the corresponding mitigation.

### Profiling of Venues

The proposed solution publishes warnings on CDN. A warning consists of the GUID of a venue and a time interval. An adversary can collect these warnings and aggregate them to compile a list of venues with the most warnings (colloquially referred to as _most infectious venues_) or a list of venues with their most recent warning.

This information is easy to collect, as warnings are publicly accessible and do not even required to make modifications to the CWA client.

The value of this information increases significantly once an adversary can link the GUID of a venue with the data included in the QR code such as the name or the address of the venue, or with metadata from other services, such as coordinates of the venue.

An adversary can collect this information for a single venue by scanning the QR code and extracting and storing the data outside of CWA. Collecting this information at scale requires coordinated effort by many individuals.

Note that CWA itself does not store this data on the server or anywhere else and cannot do profiling of venues.

To mitigate the risk, CWA encourages owners to regularly generate new QR codes for their venues. The more frequent QR codes are updated, the more difficult it is to keep a central database with venue data up-to-date.

However, we acknowledge that the proposed solution does not prevent this attack with technical means.

### Profiling of Users

The proposed solution publishes warnings on CDN in packages on an hourly basis. A package includes multiple warnings. A warning consists of the GUID of a venue and a time interval. All the warnings that were created from the check-ins of a single user are included in one package. A package can include warnings of multiple users.

An adversary can analyze the check-ins of a single package and try to build a profile of the users whose check-ins are included. This reveals limited information if the GUIDs of the venues cannot be linked to an actual venue (cf. [Profiling of Venues]), but can reveal significant information about the user the more GUIDs of venues can be identified.

To mitigate the risk, CWA generates fake check-ins for each submission. These fake check-ins are generated upon submission of genuine check-ins so that even CWA cannot distinguish them.

However, we acknowledge that this does not prevent the attack if there is a central database of all venue GUIDs and venue metadata.

### Targeting Specific Venues

The proposed solution turns check-ins of the user into warnings and cannot verify if the user has actually visited the respective venue of a check-in.

An adversary can target specific venues by obtaining the respective QR code and pretending a check-in. If the adversary also obtains the authorization to submit the check-ins to the CWA Server, false warnings would be issued for these venues.

The difficulty of this attack is dominated by the difficulty of obtaining authorization to submit check-ins. This is currently only possible with a confirmed positive test for SARS-CoV-2 or by obtaining a Tele TAN from the hotline. While a confirmed positive test is difficult obtain without putting oneself at risk, a valid Tele TAN can be obtained for example by Social Engineering.

To mitigate the risk, CWA only allows a certain number of check-ins per day. This prevents to scale such an attack by a single adversary across a multitude of venues.

However, we acknowledge that this does not prevent to execute this attack for a small number of venues.

## QR Code Structure DRAFT

The QR code of a venue contains all required attributes for Presence Tracing, so that no server communication is necessary when an attendee checks in to a venue

The data structure is described by the following Protocol Buffer message `TraceLocation`:

```protobuf
message TraceLocation {
  // uuid
  string guid = 1;
  uint32 version = 2;
  TraceLocationType type = 3;
  // max. 150 characters
  string description = 4;
  // max. 150 characters
  string address = 5;
  // UNIX timestamp (in seconds)
  uint64 startTimestamp = 6;
  // UNIX timestamp (in seconds)
  uint64 endTimestamp = 7;
  uint32 defaultCheckInLengthInMinutes = 8;
}

enum TraceLocationType {
  LOCATION_TYPE_UNSPECIFIED = 0;
  LOCATION_TYPE_PERMANENT_OTHER = 1;
  LOCATION_TYPE_TEMPORARY_OTHER = 2;

  LOCATION_TYPE_PERMANENT_RETAIL = 3;
  LOCATION_TYPE_PERMANENT_FOOD_SERVICE = 4;
  LOCATION_TYPE_PERMANENT_CRAFT = 5;
  LOCATION_TYPE_PERMANENT_WORKPLACE = 6;
  LOCATION_TYPE_PERMANENT_EDUCATIONAL_INSTITUTION = 7;
  LOCATION_TYPE_PERMANENT_PUBLIC_BUILDING = 8;

  LOCATION_TYPE_TEMPORARY_CULTURAL_EVENT = 9;
  LOCATION_TYPE_TEMPORARY_CLUB_ACTIVITY = 10;
  LOCATION_TYPE_TEMPORARY_PRIVATE_EVENT = 11;
  LOCATION_TYPE_TEMPORARY_WORSHIP_SERVICE = 12;
}
```

The `guid` attribute is generated by the CWA Server to ensure uniqueness across all CWA QR codes. The data structure is signed by the CWA Server with its private key to prevent tampering of the QR code or identity theft of the GUID of a venue.

The combination of signature and TraceLocation is represented in the following Protocol Buffer message `SignedTraceLocation`:

```protobuf
message SignedTraceLocation {
  // byte representation of a TraceLocation
  bytes location = 1;
  // byte representation of the signature of the TraceLocation
  bytes signature = 2;
}
```

A SignedTraceLocation is base32-encoded and included in a URL. The URL is the content of the QR code and structures as follows:

```shell
HTTPS://E.CORONAWARN.APP/C1/<SIGNED_TRACE_LOCATION_BASE32>

# example:
HTTPS://E.CORONAWARN.APP/C1/BIPEY33...
```

The base32 encoding allows to leverage the input mode _alphanumeric_ when generating the QR code and produces a QR code with a lower density compared to base64 encoding.

### Interoperability with Other Contact Tracing Apps DRAFT

Other contact tracing apps that leverage QR code for Presence Tracing can integrate with CWA by creating QR codes according to the following pattern:

```text
<URL>/<VENDOR_DATA>/CWA1/<ENCODED_SIGNED_TRACE_LOCATION>
```

| Parameter | Description |
|---|---|
| `<URL>` | The URL associated with the respective contact tracing apps, with or without a partial path. |
| `<VENDOR_DATA>` | Any vendor-specific data such as venue ids. This data may be passed to the vendor-specific app upon interaction by the user if a deeper integration is required. |
| `<ENCODED_SIGNED_TRACE_LOCATION>` | A representation of the Protocol Buffer message SignedTraceLocation encoded in either base32 or base64 (see recommendations below). Note that the signature must have been created by the CWA Server. |

To optimize the readability and reduce density of the QR code, CWA recommends to generate QR codes with input mode [_alphanumeric_](https://en.wikipedia.org/wiki/QR_code#Storage) and to encode byte sequences (such as Protocol Buffer messages) with base32.

**Note:** Any contact tracing apps that integrate with CWA must ensure that they do not process any information from the CWA part of the QR code.

Examples:

```text
# upper-case for alphanumeric input mode + base32 encoding
HTTPS://PRESENCE-TRACING.APP/386D0384-8AAA-41B6-93C2-D3399894D0EE/CWA1/BIPEY33...
|-----------<URL>-----------|------------<VENDOR_DATA>-----------|    |-<ENCODED_SIGNED_TRACE_LOCATION>-...|

# base64 encoding
https://check-in.pt.app/386d0384-8aaa-41b6-93c2-d3399894d0ee/CWA1/CiRmY2E...
|---------<URL>--------|------------<VENDOR_DATA>-----------|    |-<ENCODED_SIGNED_TRACE_LOCATION>-...|
```
