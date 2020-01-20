# reservation_room_app

A reservation room app.

## workflow
[refs1](https://medium.com/better-programming/ci-cd-for-flutter-apps-using-github-actions-b833f8f7aac)
[refs2](https://medium.com/flutter-community/run-flutter-driver-tests-on-github-actions-13c639c7e4ab)

https://github.com/ncipollo/release-action

[![Build Status](https://github.com/jesshaw/reservation_room_app/workflows/Test,%20Build%20and%20Release/badge.svg?branch=master)](https://github.com/jesshaw/reservation_room_app/actions?query=branch%3Amaster)


### Notes
You must provide a tag either via the action input or the git ref (i.e push / create a tag). If you do not the action will fail.
If the tag of the release you are creating does not exist yet, you should set both the tag and commit action inputs. commit can point to a commit hash or a branch name (ex - master).



[![Build Status](https://github.com/jesshaw/reservation_room_app/flutter_actions/workflows/main/badge.svg?branch=master)](https://github.com/jesshaw/reservation_room_app/flutter_actions/actions?query=workflow%3A"main"+branch%3Amaster)
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
