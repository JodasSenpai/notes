import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/auth/auth_notifier_provider.dart';
import 'package:notes/application/notes/notes/notes_notifier_provider.dart';
import 'package:notes/localization/localization_notifier.dart';
import 'package:notes/presentation/core/router.gr.dart';
import 'package:notes/translations/locale_keys.g.dart';
import 'package:styled_widget/styled_widget.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.home.tr()), actions: [
        IconButton(
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logOut();
            },
            icon: Icon(Icons.logout)),
        IconButton(
            onPressed: () {
              ref
                  .read(localeProvider.notifier)
                  .setLocale(Locale("en"), context);
            },
            icon: Icon(Icons.language)),
      ]),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.router.push(AddNoteRoute());
              },
              child: Text(LocaleKeys.add_note.tr())),
          ElevatedButton(
              onPressed: () {
                ref.read(notesNotifierProvider.notifier).getNotes();
              },
              child: Text(LocaleKeys.get_notes.tr())),
          notes.when(
              initial: () => Container(),
              loading: () => CircularProgressIndicator(),
              loaded: (allNotes) {
                return SafeArea(
                  child: SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: allNotes.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              Card(
                                  child: Text(
                                          allNotes[index].username.getOrCrash())
                                      .padding(all: 5)),
                              Text(allNotes[index].noteValue.getOrCrash())
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
