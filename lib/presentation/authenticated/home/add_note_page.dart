import 'package:auto_route/auto_route.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/auth/auth_notifier_provider.dart';
import 'package:notes/application/notes/add_note/add_note_notifier_provider.dart';
import 'package:notes/domain/auth/user/user.dart';

@RoutePage()
class AddNotePage extends ConsumerWidget {
  AddNotePage({
    Key? key,
  }) : super(key: key);
  final List<SelectedListItem> langs = [
    SelectedListItem(
      name: "English",
      value: "en",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Slovenščina",
      value: "sl",
      isSelected: false,
    ),
  ];

  void onTextFieldTap(BuildContext context, WidgetRef ref, User user) {
    DropDownState(
      DropDown(
        isSearchVisible: false,
        isDismissible: true,
        bottomSheetTitle: const Text(
          "Languages",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: langs,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.value!);
            }
          }
          ref.read(addNoteNotifierProvider(user!).notifier).setLang(list.first);
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(authNotifierProvider.notifier.select((value) =>
        value.state
            .when(authenticated: (user) => user, unauthenticated: () => null)));
    final lang = ref.watch(addNoteNotifierProvider(user!)
        .select((value) => value.lang.getOrElse("Choose lang")));
    return Scaffold(
      appBar: AppBar(title: Text("Add note")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("lang:"),
            ElevatedButton(
              onPressed: () {
                onTextFieldTap(context, ref, user!);
              },
              child: Text(lang),
            ),
            Text("username:"),
            TextField(
              controller: TextEditingController(text: user.email.getOrElse("")),
              onChanged: (value) =>
                  ref
                      .read(addNoteNotifierProvider(user!).notifier)
                      .setUsername(value),
            ),
            Text("note:"),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null, //grow automatically
              onChanged: (value) =>
                  ref
                      .read(addNoteNotifierProvider(user!).notifier)
                      .setNoteValue(value),
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(addNoteNotifierProvider(user!).notifier).addNote();
                },
                child: Text("Add note"))
          ],
        ),
      ),
    );
  }
}
