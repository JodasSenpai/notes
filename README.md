# notes

A sample project for reviewing purpose

## How to build

Run next commands in orded:

1. flutter pub get     (Getting all libraries)
2. flutter packages pub run build_runner build --delete-conflicting-outputs (Creating boilerplate code files)
3. flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" (Creating translation strings files)
4. flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys (Creating translation strings keys files)

CD/CI is made in CodeMagic
It builds on every push on main branch and after its done, it adds apk to firebase app distribution

Link to web version: https://notes-e1a86.web.app/

Link to join as tester: https://appdistribution.firebase.dev/i/cc7a9c3c86ce81a8

Link to apk on google drive: https://drive.google.com/drive/folders/16WKRqvf1jZkweDVBmFxSAytpgU-WngDc?usp=sharing