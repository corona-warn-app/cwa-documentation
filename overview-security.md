# Secure Development
## Risk Assessment
An essential part of the development of secure applications is the risk assessment. 
### Threat Modeling
At the very beginning of the development process of this solution, development teams started to conduct threat modeling workshops. Within the threat modeling workshops, the teams identified risks, assets and assumptions, decided on risk response and created or updated their security plans.

## Identified Risks, Threats and Proposed Controls
Risks and threats identified during the conducted workshops are listed below. Please note that listed risks, threats and proposed controls are non-exhaustive and will be updated regularly.

### Technical Risks
 - <a name="risk-identification-of-infected-person">Identification of infected persons and/or persons under test</a>
 	- Related threats
		- [Insecure design](#threat-insecure-design)
   		- [Insecure programming](#threat-insecure-programming)
		- [PostgreSQL SQL injection](#threat-postgresql-sql-injection)
		- [Code injection flaws](#threat-code-injection-flaws)
		- [Security misconfiguration](#threat-security-misconfiguration)
		- [Wrong choice of technology](#threat-wrong-choice-of-technology)
		- [Spoofing of mobile application](#threat-spoofing-of-mobile-application)
		- [Misbehavior of mobile application due to backup and/or restore of phone and/or mobile application](#threat-misbehavior-of-mobile-application-backup-restore)
		- [Information leakage of unprotected phone and/or mobile application](#threat-information-leakage-unprotected-phone)
		- [Tampering of test retrieval and upload parameters](#threat-tampering-test-retrieval)
		- [Tampering of diagnosis keys](#threat-tampering-diagnosis-keys)
		- [Identity disclosure through metadata correlation](#threat-identity-disclosure-meta-data-correlation)
 - <a name="risk-location-disclosure-of-infected-persons">Disclosure of the location of infected persons</a>
 	- Related threats
		- [Insecure design](#threat-insecure-design)
   		- [Insecure programming](#threat-insecure-programming)
		- [Security misconfiguration](#threat-security-misconfiguration)
		- [Wrong choice of technology](#threat-wrong-choice-of-technology)
		- [Identity disclosure through metadata correlation](#threat-identity-disclosure-meta-data-correlation)
 - <a name="risk-social-network-disclosure">Social network disclosure</a>
 	- Related threats
		- [Insecure design](#threat-insecure-design)
 - <a name="risk-disclosure-of-notification-status">Disclosure of notification status</a>
 	- Related threats
		- [Insecure programming](#threat-insecure-programming)
		- [Using components with known vulnerabilities](#threat-using-components-with-known-vulnerabilities)
		- [PostgreSQL SQL injection](#threat-postgresql-sql-injection)
		- [Code injection flaws](#threat-code-injection-flaws)
		- [Transaction hijacking](#threat-transaction-hijacking)
		- [Security misconfiguration](#threat-security-misconfiguration)
		- [Wrong choice of technology](#threat-wrong-choice-of-technology)
		- [Spoofing of mobile application](#threat-spoofing-of-mobile-application)
		- [Misbehavior of mobile application due to backup and/or restore of phone and/or mobile application](#threat-misbehavior-of-mobile-application-backup-restore)
		- [Information leakage of unprotected phone and/or mobile application](#threat-information-leakage-unprotected-phone)
		- [Tampering of test retrieval and upload parameters](#threat-tampering-test-retrieval)
		- [Tampering of diagnosis keys](#threat-tampering-diagnosis-keys)
		- [Identity disclosure through metadata correlation](#threat-identity-disclosure-meta-data-correlation)
 - <a name="risk-disclosure-of-personal-data">Disclosure of personal data</a>
 	- Related threats
		- [Insecure programming](#threat-insecure-programming)
		- [Using components with known vulnerabilities](#threat-using-components-with-known-vulnerabilities)
		- [PostgreSQL SQL injection](#threat-postgresql-sql-injection)
		- [Code injection flaws](#threat-code-injection-flaws)
		- [Transaction hijacking](#threat-transaction-hijacking)
		- [Security misconfiguration](#threat-security-misconfiguration)
		- [Wrong choice of technology](#threat-wrong-choice-of-technology)
		- [Spoofing of mobile application](#threat-spoofing-of-mobile-application)
		- [Misbehavior of mobile application due to backup and/or restore of phone and/or mobile application](#threat-misbehavior-of-mobile-application-backup-restore)
		- [Information leakage of unprotected phone and/or mobile application](#threat-information-leakage-unprotected-phone)
		- [Tampering of test retrieval and upload parameters](#threat-tampering-test-retrieval)
		- [Tampering of diagnosis keys](#threat-tampering-diagnosis-keys)
		- [Identity disclosure through metadata correlation](#threat-identity-disclosure-meta-data-correlation)
 - Non-availability of app functionality
 	- Related threats
		- [Insecure programming](#threat-insecure-programming)
		- [Using components with known vulnerabilities](#threat-using-components-with-known-vulnerabilities)
		- [PostgreSQL SQL injection](#threat-postgresql-sql-injection)
		- [Code injection flaws](#threat-code-injection-flaws)
		- [Transaction hijacking](#threat-transaction-hijacking)
		- [Security misconfiguration](#threat-security-misconfiguration)
		- [Denial-of-service attack against endpoints exposed to the internet](#threat-dos-against-internet-endpoints)
		- [Denial-of-service against phone and/or mobile application for backend communication](#threat-dos-against-phone)
		- [Mobile application acting as distributed denial-of-service device](#threat-mobile-application-as-ddos-device)
		- [Tampering of upload authorization](#threat-tampering-of-upload-authorization)
		- [Brute forcing of teleTANs](#threat-brute-forcing-of-teletans)
		- [Tampering of test retrieval and upload parameters](#threat-tampering-test-retrieval)
		- [Tampering of diagnosis keys](#threat-tampering-diagnosis-keys)
 - <a name="risk-incorrect-notification-status">Incorrect notification status</a>
 	- Related threats
		- [Insecure programming](#threat-insecure-programming)
		- [Using components with known vulnerabilities](#threat-using-components-with-known-vulnerabilities)
		- [PostgreSQL SQL injection](#threat-postgresql-sql-injection)
		- [Code injection flaws](#threat-code-injection-flaws)
		- [Transaction hijacking](#threat-transaction-hijacking)
		- [Security misconfiguration](#threat-security-misconfiguration)
		- [Missing cross-country interoperability of mobile application](#threat-missing-cross-country-interoperability)
		- [Malicious phone and/or mobile application usage](#threat-malicious-phone-application-usage)
		- [Misusage of phone and/or mobile application by user](#threat-misusage-of-phone-application)
		- [Misbehavior of mobile application due to backup and/or restore of phone and/or mobile application](#threat-misbehavior-of-mobile-application-backup-restore)
		- [Tampering of upload authorization](#threat-tampering-of-upload-authorization)
		- [Brute forcing of teleTANs](#threat-brute-forcing-of-teletans)
		- [Tampering of test retrieval and upload parameters](#threat-tampering-test-retrieval)
		- [Tampering of diagnosis keys](#threat-tampering-diagnosis-keys)
		- [False notifications](#threat-false-notifications)
### Non-Technical Risks
 - <a name="risk-no-alert-on-contact-with-international-users">No alert on contact with international infected users</a>
### Threats and Proposed Controls
#### Use-Case-Independent Threats
 - <a name="threat-insecure-design">Insecure design</a>
 	- Proposed controls
		- Use of decentralized architecture based on Google, Apple and [DP-3T](https://github.com/DP-3T/) approach
 - <a name="threat-insecure-programming">Insecure programming</a>
 	- Proposed controls
		- Static application security testing
		- Dynamic application security testing
		- Penetration testing
 - <a name="threat-using-components-with-known-vulnerabilities">Using components with known vulnerabilities</a>
 	- Proposed controls
		- Open-source software security testing
		- Regular open source software security
		- Usage of GitHub security alerts
 - <a name="threat-postgresql-sql-injection">PostgreSQL SQL injection</a>
 	- Proposed controls
		- Static application security testing
		- Dynamic application security testing
		- Penetration testing
		- Input validation
 - <a name="threat-code-injection-flaws">Code injection flaws</a>
 	- Proposed controls
		- Static application security testing
		- Dynamic application security testing
		- Penetration testing
		- Input validation		
 - <a name="threat-transaction-hijacking">Transaction hijacking</a>
 	- Proposed controls
		- TLS certificate pinning
		- TLS certificate validation
 - <a name="threat-security-misconfiguration">Security misconfiguration</a>
 	- Proposed controls
		- Security concept
		- Infrastructure as code
		- Configuration change management
		- Automated configuration checks
 - <a name="threat-dos-against-internet-endpoints">Denial of service attack agains endpoints exposed to the internet</a>
 	- Proposed controls
		- Distributed denial-of-service countermeasures
		- Use of mutual TLS v1.3 for server to server communication
#### Tracing Only
 - <a name="threat-wrong-choice-of-technology">Wrong choice of technology</a>
 	- Proposed controls
		- App-specific notification mechanism
		- Minimal logging
		- Minimal mobile application permissions
 - <a name="threat-spoofing-of-mobile-application">Spoofing of mobile application</a>
 	- Proposed controls
		- Use of iOS and Android signing and store infrastructure
 - <a name="threat-missing-cross-country-interoperability">Missing cross-country interoperability of mobile application</a>
 	- Proposed controls
		- Roaming alert
 - <a name="threat-malicious-phone-application-usage">Malicious phone and/or mobile application usage</a>
 	- Proposed controls
		- Inform user if functionality seems impaired
 - <a name="threat-misusage-of-phone-application">Misusage of phone and/or mobile application by user</a>
 - <a name="threat-misbehavior-of-mobile-application-backup-restore">Misbehavior of mobile application due to backup and/or restore of phone and/or mobile application</a>
 - <a name="threat-information-leakage-unprotected-phone">Information leakage of unprotected phone and/or mobile application</a>
 	- Proposed controls
		- Additional password protection of the mobile application
 - <a name="threat-dos-against-phone">Denial-of-service against phone and/or mobile application for backend communication</a>
 	- Proposed controls
		- Input validation
		- TLS certificate pinning
		- TLS certificate validation		
 - <a name="threat-mobile-application-as-ddos-device">Mobile application acting as distributed denial-of-service device</a>
 	- Proposed controls
		- Hardcoded server endpoints
		- Digital signature
		- Digital signature verification
		- Timestamping of digital signature
- <a name="threat-false-notifications">False notifications</a>
	- Proposed controls
		- No usage of operating system intents
#### Submission of Exposure Keys
 - <a name="threat-tampering-of-upload-authorization">Tampering of upload authorization</a>
 	- Proposed controls
		- Enforce QR code one-time-usage
		- TAN as one-time token for upload of diagnosis keys
		- Flexibility to adjust teleTAN complexity to situational needs
 - <a name="threat-brute-forcing-of-teletans">Brute forcing of teleTANs</a>
 	- Proposed controls
		- Identify clients with features such as SafetyNet attestation or similar
		- Increase teleTAN complexity
		- Decrease teleTAN lifetime
		- Security event monitoring incl. feature toggle
		- Flexibility to adjust teleTAN complexity to situational needs
 - <a name="threat-tampering-test-retrieval">Tampering of test retrieval and upload parameters</a>
 	- Proposed controls
		- Input validation
		- Digital signature
		- Digital signature verification
		- Use of mutual TLS v1.3
		- Use of TLS v1.2/1.3 server authentication only
		- Chain diagnosis key delta-packages
		- Secure database connections
		- Secure Exposure Notification Framework access
		- Identify clients with features such as SafetyNet attestation or similar
 - <a name="threat-tampering-diagnosis-keys">Tampering of diagnosis keys</a>
  	- Proposed controls
		- Input validation
		- Digital signature
		- Digital signature verification
		- Use of mutual TLS v1.3
		- Use of TLS v1.2/1.3 server authentication only
		- Chain diagnosis key delta-packages
		- Secure database connections
		- Secure Exposure Notification Framework access
		- Identify clients with features such as SafetyNet attestation or similar
 - <a name="threat-identity-disclosure-meta-data-correlation">Identity disclosure through metadata correlation</a>
 	- Proposed controls
		- Separation of metadata and payload
		- No TAN storage in verification server back end
		- Dummy packages for diagnosis key upload
		- Use mix network for anonymity during diagnosis keys upload

## Security Planning
Based on the results of the risk assessment, the teams derive the security and also privacy requirements applicable to the solution to mitigate the risks. For each applicable requirement, the team defines a suitable security control, which usually consists of a security activity, a verification measurement, and the time to apply it. The security plan encompasses all security controls that the team decides to complete.

## Security Testing
The teams performs further verifications of the implemented security controls by security testing, following the security test plan the teams created. 

### Static Application Security Testing (SAST)
Whenever possible, the developers integrate these tools directly into their tool environment and use them daily. If this is not possible, the teams sets up daily or weekly runs of the static-code analyzers and feeds the results back to the developers for immediate audit and analysis during the development. 

 - [cwa-app-android](https://github.com/corona-warn-app/cwa-app-android)
	 - Checkmarx Static Application Security Testing (CxSAST)  
 - [cwa-app-ios](https://github.com/corona-warn-app/cwa-app-ios)
	 - Checkmarx Static Application Security Testing (CxSAST) 
 - [cwa-server](https://github.com/corona-warn-app/cwa-server)
	 - Micro Focus Fortify Static Code Analyzer
 - [cwa-testresult-server](https://github.com/corona-warn-app/cwa-testresult-server)
  	 - Checkmarx Static Application Security Testing (CxSAST), SonarQube, Micro Focus Fortify Static Code Analyzer
 - [cwa-verification-iam](https://github.com/corona-warn-app/cwa-verification-iam)
   	 - Checkmarx Static Application Security Testing (CxSAST), SonarQube, Micro Focus Fortify Static Code Analyzer
 - [cwa-verification-portal](https://github.com/corona-warn-app/cwa-verification-portal)
 	 - Checkmarx Static Application Security Testing (CxSAST), SonarQube, Micro Focus Fortify Static Code Analyzer
 - [cwa-verification-server](https://github.com/corona-warn-app/cwa-verification-server)
 	 - Checkmarx Static Application Security Testing (CxSAST), SonarQube, Micro Focus Fortify Static Code Analyzer

### Open-Source Known Vulnerability Scans
Besides to SAST and whenever applicable, the developers frequently scan their used open-source components for known vulnerabilities and to mitigate findings by patching to a secure version. 

- [cwa-app-android](https://github.com/corona-warn-app/cwa-app-android)
	- BlackDuck
- [cwa-app-ios](https://github.com/corona-warn-app/cwa-app-ios)
	- BlackDuck	
- [cwa-server](https://github.com/corona-warn-app/cwa-server)
	- WhiteSource
	- Synopsys Protecode
	- Eclipse Steady (former SAP Vulas)
- [cwa-testresult-server](https://github.com/corona-warn-app/cwa-testresult-server)
	 - OWASP Dependency Checker
- [cwa-verification-iam](https://github.com/corona-warn-app/cwa-verification-iam)
	 - OWASP Dependency Checker
- [cwa-verification-portal](https://github.com/corona-warn-app/cwa-verification-portal)
	 - OWASP Dependency Checker
- [cwa-verification-server](https://github.com/corona-warn-app/cwa-verification-server)
	 - OWASP Dependency Checker

# Secure Operations
## Overview
Deutsche Telekom AG deploys a secure operations framework to maintain security during the lifecycle of all services. Operations of the corona warn app is covered by this in-house standard. Its top-level structure is divided into 18 capabilities that cover the different fields of action:
- [Asset and Configuration Management of Hardware and Software](#asset-and-configuration-management-of-hardware-and-software)
- [Vulnerability Management and Assessment](#vulnerability-management-and-assessment)
- [Incident and Problem Management](#incident-and-problem-management)
- [Change Management](#change-management)
- [Security Services](#security-services)
- [Security Testing](#security-testing-1)
- [Threat Intelligence](#threat-intelligence)
- [Technical Cyber Resilience](#technical-cyber-resilience)
- [Logging and Monitoring, Event Management and Alarming](#logging-and-monitoring-event-management-and-alarming)
- [Partner Management](#partner-management)
- [Secure Development](#secure-development-1)
- [Backup & Restore](#backup-and-restore)
- [Risk Management](#risk-management)
- [Lifecycle Management](#lifecycle-management)
- [Privileged Access Management](#privileged-access-management)
- [Physical Security](#physical-security)
- [Security Trainings and Skill Assessment](#security-trainings-and-skill-assessment)
- [Customer and Authority Interaction](#customer-and-authority-interaction)

The following chapters contain a brief introduction to each capability.

## Capability Descriptions
### Asset and Configuration Management of Hardware and Software
#### Subject
- Asset Management is a process for developing, operating, maintaining, upgrading, and disposing of hardware and software. An asset in terms of secure operations is any technical resource (configuration item). Configuration management is a process for hardware and software to establish and maintain performance consistency, ensure functional and physical attributes with its requirements and keep design and operational information throughout the lifecycle.
- The Asset Register provides an overview of all relevant assets of an organization and ensures that all relevant business information is identified, defined and organized to facilitate its use and access. Furthermore, the register avoids duplicate information. 
- Secure Operations Center (SOC) teams and Computer Emergency Response Teams (CERT) require access to this inventory.
#### Objective
- Gain overview of all relevant assets, responsibilities and ownership.
- Use the asset register as a base for vulnerability management, incident and problem management, change management, risk management, logging, monitoring, event management and alarming. Enable secure operations to act.
- Remediate vulnerabilities to reduce the likelihood of exploitation through a threat agent.

### Vulnerability Management and Assessment
#### Subject
- Vulnerability Management & Assessment collects, detects, categorizes, prioritizes and communicates vulnerabilities and remediation information. It enforces and tracks mitigation, e.g. by introducing patch management for security vulnerabilities.

#### Objective
- Provide transparency of generic vulnerabilities.
- Provide transparency of environment-specific vulnerabilities for each asset. 
- Remediate vulnerabilities to reduce the likelihood of exploitation through a threat agent.

### Incident and Problem Management
#### Subject
- Incident Management is an instrument for the structured treatment of security incidents by collaboration between security services and business operations. It includes all measures, responsibilities and principles for dealing with incidents of the operating processes.
- Management is supported by establishing standardized customer business impact categories.
#### Objective
- Minimize the impact of security incidents and problems in order to avert potential damage to the company, employees and customers - sometimes with a handover to problem management.
- Enable early identification and measurement of incidents and, if needed, timely reporting to regulatory authorities (e.g. Bundesnetzagentur, Bundesbeauftragter für den Datenschutz und die Informationsfreiheit).
- Enable standardized incident reporting and monitoring which allows management escalation to solve security incidents accordingly. 
- Manage security incidents in a standardized way.
- Generate further input for other Information Security Management System (ISMS) processes (e.g. awareness campaigns).

### Change Management
#### Subject
- The change management process has the primary goal of enabling beneficial changes while avoiding negative impact on IT services.
- Change management ensures that all changes have been approved before the go-live and monitors if the approved change is aligned with the security requirements.
#### Objective
- Avoid unsecure and unauthorized changes. 
- Reduce security risk during/due to operational changes. This applies if security-relevant aspects of the change have not been considered before.
- Remediate vulnerabilities through change management to reduce the chance of exploitation through a threat agent.

### Security Services
#### Subject
- Security Services include a single point of contact for internal/external incident reporters who perform a first evaluation of and reaction to security incidents. In case of critical incidents, additional on-demand incident response/hunting capabilities are available to perform a deep-dive analysis and resolution.
- Last-level security responsibility as part of security services handles and takes responsibility for security incidents where dispatch is unclear.
#### Objective
- Evaluate security incidents and minimize the response time including certain event messages and alarming as well as incidents triggered by user reports. 
- Handle reported security incidents.
- Minimize the impact of security incidents.
- Provide deep-dive analyses of critical incidents (e.g. advanced persistent threats (APT)).
- Resolve “deadlock” situations during security incidents.
- Support certificates.

### Security Testing
#### Subject
- Security testing checks whether the security measures and procedures are still in line with the risk assessments from the company's point of view; check whether the corresponding measures and procedures are regularly tested and kept up to date. Infiltrate through existing perimeters (e.g. technical, physical, access control).
- Security testing assesses if system and configuration settings are compliant to the security requirements and if the implementation contains vulnerabilities. 
- It verifies of company and industry requirements e.g. through audits
- During the lifecycle of a system or application, different types of testing are required. Findings are addressed in related ITIL processes.
#### Objective
- Identify, remediate or accept 
	- known (e.g. existing Common Vulnerabilities and Exposures(CVE) score) vulnerabilities, 
	- undiscovered (e.g. SQL injection) vulnerabilities and 
	- architectural/processing vulnerabilities.
- Ensure that security and business requirements are fulfilled.

### Threat Intelligence
#### Subject
- Threat Intelligence collects, assesses and shares information on technical and non-technical threats. 
- This information is enriched/extended by collaboration with external associations and non-profit organizations (e.g. FIRST, DAX 30, CSSA, ISF, etc.). It is primarily used for updating the technical security defense and monitoring infrastructure.
#### Objective
- Provide transparency and situational awareness for technical and non-technical cyber security threats.

### Technical Cyber Resilience
#### Subject
- Technical Cyber Resilience solutions defend against specific threats. They are planed, built and operated based on threat exposure. This includes reaction processes for alerts. 
- Examples: distributed denial-of-service (DDoS) attack protection, intrusion detection systems (IDS) / intrusion prevention systems (IPS), APT detection, antivirus, web application firewalls, proxies, spam filter. 
#### Objective
- Minimize impact of specific threats and attacks that consist of: 
	- Dynamic polymorphic malware 
	- Multi-stage malware
	- (Multi-vector) Distributed denial-of-service attack
	- Coordinated persistent attack 
	- Network anomalies
- Prevent unauthorized access and modification.
- Provide secure architectures (e.g. layered security).
- Support service continuity and disaster recovery.

### Logging and Monitoring, Event Management and Alarming
#### Subject
- Logging and Monitoring, Event Management and Alarming covers the steps from a single log entry on a device up to creating a resulting security incident. It contains activities like log and alarm definition, log transport and security information and event management system (SIEM) operation including event correlation and analytics.
- Messages and log files of different systems will be collected and evaluated. Suspicious events or dangerous trends can be detected (in real time).
#### Objective
- Detect attackers on internal networks due to behavior that triggers use cases.
- Support investigations in the context of intrusions, breaches, regulatory or policy violations by focusing on highly technical evidence acquisition and evidence analysis. 
- Provide input to and support an incident response process. 
- Provide input to and support legal/disciplinary actions by giving a plausible reconstruction of attacker or user activity.
- Troubleshoot operational security problems.
- Provide advice on needed and common logfiles.

### Partner Management
#### Subject
- Partner Management supports buyers to avoid or reduce risks associated with third-party products and services. 
- Security requirements must be also fulfilled by external service providers / partners. Therefore, this must be clearly stated in the contracts (e.g. security annex, data processing agreement (DPA), audit rights). The requirements relate among other things to the identification of risks, contract management, control of service during execution and withdrawal of authorizations from external parties upon termination of service provision.
- The partner must ensure functioning hiring and leaving processes for their employees. If needed, services must be provided by security-checked employees.
- The partner must deliver security-related services such as vulnerability information, patch and release delivery or incident collaboration and support. 
#### Objective
- Guarantee a consistently high level of security even for services performed by external partners.
- Avoid security gaps in contracts.
- Guarantee collaboration and support by partners in case of security incident (e.g. to update or recover a system in the specified time).
- Ensure controlled, monitored and minimized access for partners.
- Ensure compliance with internal/external requirements (e.g. security checks).
- Cooperate with selected/certified suppliers (blacklist/whitelist).

### Secure Development
#### Subject
- Secure development (security by design and default) includes considering security aspects in the development stage of systems and platforms adequately. Default settings (e.g. required privileges) should be as low as possible and rarely used features should be deactivated by default. This is a prerequisite for secure operations.
- Some security problems detected during the operations phase can be fixed with a workaround. This should be reported back to development as part of a systematic feedback from operations to development and vice versa. 
#### Objective
- Operate/use only secure systems/platforms.
- Enhance secure development by providing feedback from secure operations.

### Backup and Restore
#### Subject
- Backup and restore in terms of secure operations means to create backups and restore from backups in a secure way in case of disaster recovery.
#### Objective
- Ensure integrity, availability and confidentiality of backups.
- Ensure defined retention times.

### Risk Management
#### Subject
- Risk Management in terms of secure operations means that security risks are transferred and treated according to the risk management process.
#### Objective
- Identify and assess risks and hand them over to the according risk management process.
- Treat risks with a structured approach (e.g. defined ownership, risk lifecycle, report, review tracking). 
- Provide resources for enhanced risk mitigation.

### Lifecycle Management
#### Subject
- Lifecycle Management in terms of secure operations focuses on technical rule sets, digital certificates and software in general.
- Lifecycle Management ensures 
	- maintenance of technical rule sets, 
	- digital certificates being updated with end of life and
	- deactivation of systems out of support of the partner. 
#### Objective
- Ensure up-to-dateness and traceability of technical security rule sets (e.g. firewall configuration).
- Ensure operation only of systems (Development/Test/Production) that are still actively supplied with security patches from the vendor.
- Ensure that digital certificates are always valid.

### Privileged Access Management
#### Subject
- Privileged access management in terms of secure operations focuses on control processes and the monitoring of accounts with elevated rights.
#### Objective
- Ensure that privileged access is only granted on a need-to-know basis.
- Ensure segregation of duties.
- Ensure detection, alarming and reaction regarding privileged access policy violations.
- Ensure trustworthy and complete authorization for employees and 3rd parties.

### Physical Security
#### Subject
- Physical Security considers the security of buildings/locations (e.g. data center) and the protection/maintenance of infrastructure and resources as well as access controls to prevent loss, damage, theft, compromise or service interruption of an organization's assets.
#### Objective
- Maintain confidentiality, integrity and availability from a physical access perspective.

### Security Trainings and Skill Assessment
#### Subject
- Security trainings and skill assessments
	- inform about the specific company guidelines and processes for security. Participants receive information on which procedures to follow or which persons to inform when security-relevant events are detected.
	- inform about specific threat scenarios which should be known by all employees. 
	- provide guidance for administrators in form of how-tos (e.g. log file extraction and transfer, etc.). 
- Specific trainings for security/operation staff (e.g. incident response, IDS, etc.) must be available.
#### Objective
- Strengthen the overall safety awareness and minimize the risks to IT security caused by internal and external employees 
- Gain awareness to handle security threats.
- Improve staff’s abilities to perform secure operations.

### Customer and Authority Interaction
#### Subject
- Customer interaction in terms of secure operations means extending existing customer communication with security subjects and ensure the availability of a real-time communication channel in case of an incident. 
- Adequately and timely communication with authorities and stakeholders is required.
#### Objective
- Improve customer relationship/satisfaction.
- Foster trustful partnerships. 
- Gain ideas for product improvements. 
- Provide standardized communication structure in case of incident.
- Support customers in identifying security gaps at an early stage and initiate appropriate measures.
- Ensure compliance with reporting obligations towards authorities. Examples:
	- General data protection regulation (GDPR)
	- Sarbanes-Oxley Act (SOX)
	- Kritische Infrastrukturen (KRITIS) 
- Ensure prompt action to media reports (e.g. fake news).
