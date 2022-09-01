import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_firebase_ddd_course/domain/notes/i_note_repository.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note_failure.dart';

part 'note_watcher_event.dart';
part 'note_watcher_state.dart';
part 'note_watcher_bloc.freezed.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository _noteRepository;
  StreamSubscription? _notesSubscription;

  NoteWatcherBloc(this._noteRepository) : super(const _Initial()) {
    on<NoteWatcherEvent>((event, emit) async {
      await event.map(
        watchAllStarted: (event) => _onWatchAllStarted(event, emit),
        watchUncompletedStarted: (event) =>
            _onWatchUncompletedStarted(event, emit),
        notesReceived: (event) => _onNotesReceived(event, emit),
      );
    });
  }

  Future<void> _onWatchAllStarted(
    NoteWatcherEvent event,
    Emitter<NoteWatcherState> emit,
  ) async {
    emit(const _LoadInProgress());
    await _notesSubscription?.cancel();
    _notesSubscription = _noteRepository.watchAll().listen(
          (failureOrNotes) => add(
            _NotesReceived(failureOrNotes),
          ),
        );
  }

  Future<void> _onWatchUncompletedStarted(
    _WatchUncompletedStarted event,
    Emitter<NoteWatcherState> emit,
  ) async {
    emit(const _LoadInProgress());
    await _notesSubscription?.cancel();
    _notesSubscription = _noteRepository.watchUncompleted().listen(
          (failureOrNotes) => add(
            _NotesReceived(failureOrNotes),
          ),
        );
  }

  Future<void> _onNotesReceived(
    _NotesReceived event,
    Emitter<NoteWatcherState> emit,
  ) async {
    emit(
      event.failureOrNotes.fold(
        (f) => _LoadFailure(f),
        (notes) => _LoadSuccess(notes),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _notesSubscription?.cancel();
    return super.close();
  }
}
