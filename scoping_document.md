# TABLE OF CONTENTS
1. [INTRODUCTION](#introduction)
2. [USER JOURNEY](#user-journey)
   1. [Description of Users (Stakeholders)](#description-of-users-stakeholders)
   2. [User Journey](#user-journey-1)
3. [FUNCTIONAL DESCRIPTION](#functional-description)
   1. [Overview of Epics](#overview-of-epics)
   2. [Overview of User Stories](#overview-of-user-stories)
      1. [Onboarding and Installation](#onboarding-and-installation)
      2. [Information and Instructions for Using the App](#information-and-instructions-for-using-the-app)
      3. [Use in the Regular Process](#use-in-the-regular-process)
      4. [Exposure (Contact with an Infected Person)](#exposure-contact-with-an-infected-person)
      5. [Notification of Covid-19 Test Results](#notification-of-covid-19-test-results)
      6. [Triggering a Warning](#triggering-a-warning)
      7. [Parameter Settings](#parameter-settings)
      8. [Technical Support](#technical-support)
      9. [Accessibility](#accessibility)
      10. [Content Management](#content-management)

NOTE: This Scoping Document is also available [in German](translations/scoping_document.de.md).

HINWEIS: Dieses Scoping-Dokument ist ebenfalls [auf Deutsch](translations/scoping_document.de.md) verfügbar.

# INTRODUCTION
The aim of the Corona-Warn-App is to identify SARS-CoV-2 chains of infection as quickly as possible and to break them. It does this by rapidly and reliably notifying users who have come into contact with infected users of the app that they may have been exposed to the virus. These individuals can then self-isolate to help stop the SARS-CoV-2 pandemic.

This document describes the functional requirements of the app’s design from a technical and process-based perspective. This version of the scope document describes the first release and an initial version of the app only.

The overall planning also foresees publishing other development documents, to solicit feedback from an early stage for potential incorporation in the project. The release architecture document and back-end alpha source code will be made available subsequently.

The requirements have been defined and outlined according to a user-centric methodology. This means the entire process flow is designed from the perspective of the respective app users and the other stakeholders involved in the process. The aim is to map user needs in such a way that it promotes a high degree of acceptance and makes the respective functions intuitive to use.

The interaction points and user experience are mapped based on a user journey. The resulting requirements are assigned to “epics”, or descriptions of the requirements at a high level of abstraction. These epics describe the individual contact points and general functions throughout the process that are required for usage and acceptance of the app. In turn, the epics are used to derive the detailed requirements in the form of user stories (software requirements formulated in everyday language). Through this approach, the individual requirements are structured as they are incorporated in the development process.

# USER JOURNEY

## Description of Users (Stakeholders)
The following key users and stakeholders are integrated in the user journey, or overall process, and described in their roles:

#### App User
Any potential user who uses the app to find out whether they have been near anyone who is infected, to verify their own test results, and who then, under a pseudonym and voluntarily, warns all other users.

#### Hotlines
Support app users in answering questions about how to use the app, the technology, and data privacy. If asked, they provide information on proper conduct and where to get further information in case of contact or infection.
Help verify and release test results in the app for infected individuals and can recommend them to contact their health department.

#### Robert-Koch-Institut (RKI)
Provides epidemiological information and recommendations for action to app users (content). Determines the parameters used to measure the number of contacts (to the extent of the API’s technical capabilities).
## User Journey
App usage is divided into different phases, based on contact points and user interactions that occur successively. In each phase, users are assigned motivations or requirements that meet their expectations of the app and guide them intuitively through the process.

![Graphic 5: User Journey](user_journey.png "User Journey")

#### Idea phase
In this phase, a user decides to get more information about the app. In this phase, users may have different questions regarding usage of the app (application, data privacy, accessibility, and so on). It should be possible to have these questions answered before downloading the app (hotline, information on the websites of the RKI, Federal Ministry of Health (BMG), App Store/Google Play Store).

#### Installation phase
A user decides to download the app (App Store/Google Play Store) and, after the technical installation process, is given an introduction to the app the first time it is opened. In this introductory phase, app users are given an overview of the functionality, terms of use, and privacy provisions; are asked for the necessary consent; and guided through the notification and other settings.

#### Usage phase
The usage phase is subdivided into four further areas, in which app users have different needs.

1. **Background**

   In idle mode, the application runs in the background on the smartphone and saves the pseudo IDs of other nearby app users, automatically and encrypted. At regular intervals, the app pulls from the server a list of pseudo IDs of the app users who have voluntarily reported that they are infected. The app compares their pseudo IDs with those stored on the smartphone to determine whether there has been any exposure.

2. **Exposure**

   If exposure to infected persons is determined, the app user receives a notification and recommendations on what to do. For instance, that they should contact their physician, their health department, and whether they should self-isolate.

3. **Testing**

   If the app user is tested for a SARS-CoV-2 infection, they can start the digital test information process in the app, which notifies them of their test result.

4. **Infection case**

   If an app user tests positive for infection, they can voluntarily publish the pseudonymized warn ID saved in their app. That way, other app users can use their smartphone to find out whether they were in contact with the infected user.

#### Uninstallation phase
An app user can uninstall the app at any time, and completely delete all the data stored in it.

# FUNCTIONAL DESCRIPTION
## Overview of Epics
The app functions are divided into user process phases (with direct ties to the user journey) and general support processes. An overview of the epics is depicted below:

#### User process phases
| # | Epic | Description |
|---:|--------|--------------|
| 1 | Onboarding and Installation | All processes that take place the first time the app is used (such as consent, data privacy, language selection) |
| 2 | Information and Instructions for Using the App | Help tools for using the app (such as user manual, tutorial), as well as publication information for the app |
| 3 | Use in the Regular Process | App functions in idle mode (such as activate/deactivate, changing settings, monitoring app activities) |
| 4 | Exposure (Contact with an Infected Person) | Contains all the functions associated with contact points (such as notifications, recommended actions) |
| 5 | Notification of Covid-19 Test Results | Functions related to the notification of test results |
| 6 | Warning trigger | Process to trigger a warning if a test result is positive |

#### Support processes
| # | Epic | Description |
|---:|--------|--------------|
| 7 | Parameter Settings | Parameters for contact point definition |
| 8 | Technical Support | Support processes (such as hotlines) |
| 9 | Accessibility | Apps from public authorities must be accessible, pursuant to the German Act on Equal Opportunities for Persons with Disabilities (BGG, section 12). Apps should be usable by all persons with disabilities. |
| 10 | Content Management | To adjust and update content in the app (texts, links, hotlines, and so on) |

## Overview of User Stories
The requirements the Corona-Warn-App must satisfy, and which define its functional scope, are formulated below in the usual format of a user story:

_“As a &lt;stakeholder&gt;, I want to &lt;perform action&gt;, to &lt;achieve the desired result&gt;.”_

The corresponding acceptance criteria supplement the specification of the requirements by defining the conditions that the software must fulfill to satisfy customer needs.

### Onboarding and Installation
| # of user story ID | User story | Acceptance criteria |
|-----------------|------------|--------------------|
| E01.01 | As an app user, the first time I launch the app, I want to receive an introduction to how it works (app motivation). | 1. An introduction to how the app works is displayed the first time the app is launched.<hr/>2. The introduction to how the app works is not displayed when the app is launched subsequently.<hr/>3. The explanatory content is available to app users in the respective functional areas. |
| E01.02 | As an app user, the first time I launch the app, I want to be notified about the terms of use and privacy provisions (data privacy screen) and grant my consent, so I know how my data will be used within the app. | 1. By using the app, the app user accepts the terms of use and privacy provisions.<hr/>2. The terms of use can be displayed within the app.<hr/>3. The consent prompt is shown only the first time a user launches the app. |
| E01.03 | As an app user, the first time I use the app, I want to be asked whether I consent to the creation of pseudonymized IDs and sending them to devices near me, so I am informed about how the app works. | 1. Confirmation of the creation of pseudonymized IDs and sending them to nearby devices by the app is a prerequisite for using the app.<hr/>2. The prompt no longer appears after the first time the app is used. |
| E01.04 | As an app user, the first time I use the app, I want to be asked whether the application can access the smartphone’s Bluetooth function, so I can control how the app is used on the smartphone. | 1. In using the app, users confirm access to the Bluetooth (BLE) function. |
| E01.05 | As an app user, the first time I use the app, I want to be asked whether the application can send me notifications, so I can receive push notifications in a variety of situations. | 1. The app’s notification settings are queried before the app is used for the first time.<hr/>2. The prompt no longer appears after the first time the app is used. |
| E01.06 | As an app user, I want the app to be displayed in my language the first time I use it, so I understand what is happening. | 1. The configured system language is detected.<hr/>2. If the content is not available in the detected system language, English is selected by default.<hr/>3. The first version of the app is expected to be available also in languages other than English. |
| E01.07 | As an app user, I want to see help and settings regarding accessibility, so I can use the app. | 1. Accessibility is provided depending on the options available in the respective operating system. |

### Information and Instructions for Using the App
| # of user story ID | User story | Acceptance criteria |
|-----------------|------------|--------------------|
| E02.01 | As an app user, I want to have access to a FAQ list, to find answers to questions I might have about the app. | 1. A link to a web page with FAQs is defined in the app menu. |
| E02.02 | As an app user, I want to have access to instructions that tell me how to use the app and its functions. | 1. A link to a web page with a user manual is defined in the app menu. |
| E02.03 | As an app user, I want to have access to an explanatory video for the app, so I understand how to use the app and its functions. | 1. A link to a web page with a user manual is defined in the app menu. |
| E02.04 | As an app user, I want to be able to display publication information for the app, so I can see who is responsible for development and content of the app. | 1. There is a “Publication information” item in the menu.<hr/>2. The publication information contains the usual information required. |
| E02.05 | As an app user, I want to be able to display the terms of use and data privacy information at any time. | 1. The app provides simple access to the terms of use and data privacy information. |
| E02.06 | As an app user, I want to be able to see various hotlines for technical, privacy-related, health-related, and psychological questions, as well as for verification of test results, so I can receive information or answers to my questions. | 1. Display of phone numbers of the hotlines (for technical, privacy-related, health-related, and psychological questions).<hr/>2. Display the times when the hotline can be reached (for example: 24/7)<hr/>3. Phone numbers can be called directly from the app. |

### Use in the Regular Process
| # of user story ID | User story | Acceptance criteria |
|-----------------|------------|--------------------|
| E03.01 | As an app user, I want to be able to activate and deactivate the app, to switch the function on and off. | 1. A toggle button activates and deactivates the function (Bluetooth in the background and hash generation).<hr/>2. The consequences of activation/deactivation are explained. |
| E03.02 | As an app user, I want to be able to reset to the app to the delivery defaults, so I can reconfigure it. | 1. The app can be reset to the delivery defaults with a setting option, but the traces saved from recent days are retained. |
| E03.03 | As an app user, I want to be able to adjust the app settings (access permissions, such as Bluetooth and notifications) in a menu, so I can manage the app functions and accesses. | 1. App users can call a menu for app settings.<hr/>2. Notifications can be activated and deactivated.<hr/>3. The user can permit the app to access Bluetooth, and remove that permission.<hr/>4. Before access permissions are deactivated, I receive information as to which app functions will no longer work (in full). |

### Exposure (Contact with an Infected Person)
| # of user story ID | User story | Acceptance criteria |
|-----------------|------------|--------------------|
| E04.01 | As an app user, I want to be notified when a person I have had contact with has reported an infection. I can then take the appropriate measures to stop the spread of the virus. | 1. The app sends a notification to the app user.<hr/>2. The notification notifies the app user that the risk has changed (depending on the provided API function). |
| E04.02 | As an app user, if I am exposed to the virus, I want to receive instructions from the application, so I can adapt my behavior to RKI recommendations. | 1. Notification leads to defined recommended actions in case of exposure. |

### Notification of Covid-19 Test Results
| # of user story ID | User story | Acceptance criteria |
|-----------------|------------|--------------------|
| E05.01 | As the RKI, I want only positive tested users to trigger a one-time warning, to avoid misuse. | 1. Only positive tests can trigger a warning.<hr/>2. A warning can only be triggered once for each test. |
| E05.02 | As an app user, in case of a positive test result, I want to receive information about the illness and the necessary next steps, so I can adapt my behavior to RKI recommendations. | 1. Notification of receipt of a test result.<hr/>2. Display of an information text in the app with defined content (such as information about the outcome of the test result, information about necessary measures, a hotline number). |

### Triggering a Warning
| # of user story ID | User story | Acceptance criteria |
|-----------------|------------|--------------------|
| E06.01 | As a user of the app, I want to be able to scan a QR code provided by my doctor or test center so I can receive my test result in the Corona-Warn-App. | 1. A QR code provided on a flyer from the doctor or test center can be scanned with the warn app.<hr/>2. An explanatory text is displayed. |
| E06.02 | As a user of the app, I want to be notified within the Corona-Warn-App as soon as a test result becomes available. | 1. The app user receives a notification as soon as a verified test result is available.<hr/>2. The notification does not indicate whether the result is positive or negative. |
| E06.03 | As a user of the app, if I receive a positive test result, I want to be able to grant my consent to sending the pseudonymized IDs, under which I was visible to other app users in recent days, to the Warn server so the people I have been in contact with can be warned by their apps. | 1. The IDs can be sent to the Warn server pseudonymized.<hr/>2. Data transmission is only possible if successfully verified beforehand.<hr/>3. Data transmission is only possible if the app user has granted consent beforehand. |
| E06.04 | As a user of the app, I want to be able to use a manual process (in addition to the digital process), for example, through a call center and without a QR code, to send the pseudonymized IDs, under which I was visible to other app users in recent days, to the Warn server so the people I have been in contact with can be warned by their apps. | 1. The center responsible can generate a TAN and provide it to the app user (the TAN is generated by a server, not the call center itself). |
| E06.05 | As an app user, I want to be able to enter a TAN in the app, to use the TAN I have been given to assign my test result to my instance of the app. | 1. It is possible to enter a TAN within the app.<hr/>2. Verify and provide feedback as to whether the entered TAN was correct (must be checked whether technically possible). |
| E06.06 | As a user of the app, after the TAN is verified, I want to share my pseudonymized IDs and warn persons I may have been in contact with. | 1. The IDs can be sent to the Warn server pseudonymized.<hr/>2. Data transmission is only possible if successfully verified beforehand.<hr/>3. Data transmission is only possible if the app user has granted consent beforehand. |

### Parameter Settings
| # of user story ID | User story | Acceptance criteria |
|-----------------|------------|--------------------|
| E07.01 | As the RKI, I want to be able to configure the parameters (to the extent the API is able to do this) for risk scoring so I can keep up with the latest research findings on virus transmission. | 1. Thresholds can be configured dependent on the provided API.<hr/>2. These settings will be modified on user devices without requiring an update of the app. |

### Technical Support
| # of user story ID | User story | Acceptance criteria |
|-----------------|------------|--------------------|
| E08.01 | As an app user, I want to be able to contact a hotline, to resolve technical problems with the app. | 1. The phone number of the technical hotline is stored in the application. |

### Accessibility
| # of user story ID | User story | Acceptance criteria |
|-----------------|------------|--------------------|
| E09.01 | As a user of the app, I want it to have audio output (if I have impaired or no vision, for example). | 1. Accessibility regarding audio output is provided depending on the options available in the respective operating system. |
| E09.02 | As an app user, I want to have good contrast settings, modifiable font sizes, and an easily readable font, so I can read the texts in the app easily. | 1. Accessibility regarding contrast and font size/type is provided depending on the options available in the respective operating system. |
| E09.03 | As an app user, I want to have content in simplified language, so I can easily understand how to use the app and why I should use it. | 1. Accessibility is taken into account within content management. |

### Content Management
| # of user story ID | User story | Acceptance criteria |
|-----------------|------------|--------------------|
| E10.01 | As the RKI, I want to manage the app content centrally, so I can update texts, links, hotlines, and so on once for all the places in the app. | 1. Content management will be carried out based on RKI requirements.<hr/>2. Content will be differentiated by static and dynamic content, in line with technical feasibility.<hr/>3. In the initial version, updates will be performed through an app update. |
