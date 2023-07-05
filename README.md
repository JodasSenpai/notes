# notes

A sample project for reviewing purpose

## How to build

Run next commands in orded:

1. flutter pub get     (Getting all libraries)
2. flutter packages pub run build_runner build --delete-conflicting-outputs (Creating boilerplate code files)
3. flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" (Creating translation strings files)
4. flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys (Creating translation strings keys files)


