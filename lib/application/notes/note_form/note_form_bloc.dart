import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_firebase_ddd_course/domain/notes/i_note_repository.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note_failure.dart';
import 'package:notes_firebase_ddd_course/domain/notes/value_objects.dart';
import 'package:notes_firebase_ddd_course/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository _noteRepository;

  NoteFormBloc(this._noteRepository) : super(NoteFormState.initial()) {
    on<NoteFormEvent>((event, emit) async {
      await event.map(
        initialized: (initialized) => _onInitialized(initialized, emit),
        bodyChanged: (bodyChanged) => _onBodyChanged(bodyChanged, emit),
        colorChanged: (colorChanged) => _oncolorChanged(colorChanged, emit),
        todosChanged: (todosChanged) => _onTodosChanged(todosChanged, emit),
        saved: (saved) => _onSaved(saved, emit),
      );
    });
  }

  Future<void> _onInitialized(
      _Initialized initialized, Emitter<NoteFormState> emit) async {
    emit(
      initialized.initialNoteOption.fold(
        () => state,
        (initialNote) => state.copyWith(
          note: initialNote,
          isEditing: true,
        ),
      ),
    );
  }

  Future<void> _onBodyChanged(
      _BodyChanged bodyChanged, Emitter<NoteFormState> emit) async {
    emit(
      state.copyWith(
        note: state.note.copyWith(
          body: NoteBody(bodyChanged.bodyStr),
        ),
        saveFailureOrSuccessOption: const None(),
      ),
    );
  }

  Future<void> _oncolorChanged(
      _ColorChanged colorChanged, Emitter<NoteFormState> emit) async {
    emit(
      state.copyWith(
        note: state.note.copyWith(
          color: NoteColor(colorChanged.color),
        ),
        saveFailureOrSuccessOption: const None(),
      ),
    );
  }

  Future<void> _onTodosChanged(
      _TodosChanged todosChanged, Emitter<NoteFormState> emit) async {
    emit(
      state.copyWith(
        note: state.note.copyWith(
          todos: List3(
            todosChanged.todos.map(
              (primitive) => primitive.toDomain(),
            ),
          ),
        ),
        saveFailureOrSuccessOption: const None(),
      ),
    );
  }

  Future<void> _onSaved(_Saved saved, Emitter<NoteFormState> emit) async {
    Either<NoteFailure, Unit>? failureOrSuccess;

    emit(
      state.copyWith(
        isSaving: true,
        saveFailureOrSuccessOption: const None(),
      ),
    );

    if (state.note.failureOption.isNone()) {
      failureOrSuccess = state.isEditing
          ? await _noteRepository.update(state.note)
          : await _noteRepository.create(state.note);
    }

    emit(
      state.copyWith(
        isSaving: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
