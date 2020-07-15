# Versioning

All components of the Corona Warn App use [Semantic versioning](https://semver.org/).

Given a version number MAJOR.MINOR.PATCH, increment the:

- MAJOR version when you make incompatible API changes,
- MINOR version when you add functionality in a backwards compatible manner, and
- PATCH version when you make backwards compatible bug fixes.

We plan to never deprecate outdated API versions. That means that even on MAJOR version changes our goal is to keep the old API functional.

## Maintaining compatible versions

Backend components will always remain compatible due to ongoing the availability of old API versions.

To ensure that all clients use the current "state of the art" information in order to apply the respective algorithms the cwa-server component can deprecate older Android and iOS app versions. The current minimum required app versions can be viewed in the [App Version Config](https://github.com/corona-warn-app/cwa-server/blob/master/services/distribution/src/main/resources/master-config/app-version-config.yaml).
The `app-version-config` is checked by the mobile clients on a regular basis. When the client detects that the required `min` version is higher than the current installed version, the user will be notified about the need to update the app. The app will not be useable until this update is performed.

## Changelogs

Changelogs can be found the in release notes attached to git tags, e.g. [Android App, Version 1.0.3](https://github.com/corona-warn-app/cwa-app-android/releases/tag/1.0.3).
