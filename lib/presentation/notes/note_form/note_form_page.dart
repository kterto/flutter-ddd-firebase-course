import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase_ddd_course/application/notes/note_form/note_form_bloc.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note.dart';
import 'package:notes_firebase_ddd_course/injection.dart';
import 'package:notes_firebase_ddd_course/presentation/routes/router.gr.dart';

@RoutePage()
class NoteFormPage extends StatelessWidget {
  const NoteFormPage({
    super.key,
    this.editedNote = const None(),
  });

  final Option<Note> editedNote;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NoteFormBloc>()
        ..add(
          NoteFormEvent.initialized(editedNote),
        ),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
        listenWhen: (p, c) =>
            p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(
            () => {},
            (either) => either.fold(
              (failure) => FlushbarHelper.createError(
                message: failure.when(
                  unexpected: () =>
                      "Unexepcted error occured, please contact suport",
                  insufficientPersmission: () => "Insuficient Permissions ❌",
                  unableToUpdate: () =>
                      "Couldn't update note. Was it deleted from another",
                ),
              ).show(context),
              (_) => AutoRouter.of(context).popUntil(
                (route) => route.settings.name == NotesOverviewRoute.name,
              ),
            ),
          );
        },
        buildWhen: (p, c) => p.isSaving != c.isSaving,
        builder: (context, state) => Stack(
          children: [
            const NoteFormPageScaffold(),
            SavingInProgressOverlay(isSaving: state.isSaving),
          ],
        ),
      ),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  const SavingInProgressOverlay({
    super.key,
    required this.isSaving,
  });

  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        constraints: const BoxConstraints.expand(),
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: isSaving
                ? [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 8),
                    Text(
                      'Saving',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                    ),
                  ]
                : const [],
          ),
        ),
      ),
    );
  }
}

class NoteFormPageScaffold extends StatelessWidget {
  const NoteFormPageScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (p, c) => p.isEditing != c.isEditing,
          builder: (context, state) {
            return Text(state.isEditing ? 'Edit a note' : 'Create a note');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<NoteFormBloc>(context).add(
                const NoteFormEvent.saved(),
              );
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
    );
  }
}
