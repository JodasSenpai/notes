import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/notes/notes/notes_notifier.dart';
import 'package:notes/application/notes/notes/notes_state.dart';
import 'package:notes/core/injection_container.dart';
import 'package:notes/domain/notes/notes_repository.dart';

final notesNotifierProvider =
    StateNotifierProvider.autoDispose<NotesNotifier, NotesState>(
        (ref) => NotesNotifier(notesRepository: sl<INotesRepository>()));
