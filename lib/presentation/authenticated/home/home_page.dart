import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/auth/auth_notifier_provider.dart';
import 'package:notes/application/notes/notes/notes_notifier_provider.dart';
import 'package:notes/presentation/core/router.gr.dart';
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
      appBar: AppBar(title: Text("Home"), actions: [
        IconButton(
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logOut();
            },
            icon: Icon(Icons.logout))
      ]),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.router.push(AddNoteRoute());
              },
              child: Text("Add note")),
          ElevatedButton(
              onPressed: () {
                ref.read(notesNotifierProvider.notifier).getNotes();
              },
              child: Text("get notes")),
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
