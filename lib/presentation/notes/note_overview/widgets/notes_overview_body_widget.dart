import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase_ddd_course/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:notes_firebase_ddd_course/presentation/notes/note_overview/widgets/critical_failure_display_widget.dart';
import 'package:notes_firebase_ddd_course/presentation/notes/note_overview/widgets/error_note_card_widget.dart';
import 'package:notes_firebase_ddd_course/presentation/notes/note_overview/widgets/note_card_widget.dart';

class NotesOverviewBody extends StatelessWidget {
  const NotesOverviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadSuccess: (loadedState) {
            return ListView.builder(
              itemCount: loadedState.notes.size,
              itemBuilder: (context, index) {
                final note = loadedState.notes[index];

                if (note.failureOption.isSome()) {
                  return ErrorNoteCard(
                    note: note,
                  );
                } else {
                  return NoteCard(note: note);
                }
              },
            );
          },
          loadFailure: (failedState) {
            return CriticalFailureDisplay(failure: failedState.noteFailure);
          },
        );
      },
    );
  }
}
