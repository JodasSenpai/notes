import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/notes/add_note/add_note_notifier.dart';
import 'package:notes/application/notes/add_note/add_note_state.dart';
import 'package:notes/core/injection_container.dart';
import 'package:notes/domain/auth/user/user.dart';
import 'package:notes/domain/core/value_objects.dart';
import 'package:notes/domain/notes/notes_repository.dart';

final addNoteNotifierProvider =
    StateNotifierProvider.family<AddNoteNotifier, AddNoteState, User>(
        (ref, user) => AddNoteNotifier(
            notesRepository: sl<INotesRepository>(),
            user: user,
            lang: StringSingleLine("sl"),
            username: StringSingleLine(user.email.getOrCrash())));
