import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:notes_firebase_ddd_course/domain/notes/i_note_repository.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note_failure.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note.dart';
import 'package:notes_firebase_ddd_course/infrastructure/core/firestore_helpers.dart';
import 'package:notes_firebase_ddd_course/infrastructure/notes/note_dtos.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _firebaseFirestore;

  NoteRepository(this._firebaseFirestore);

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      final userDoc = await _firebaseFirestore.userDocument();
      final noteDTO = NoteDTO.fromDomain(note);

      await userDoc.noteCollection
          .doc(note.id.getOrCrash())
          .set(noteDTO.toJson());

      return const Right(unit);
    } on PlatformException catch (e) {
      if (e.message?.contains('PERMISSION_DENIED') == true) {
        return const Left(InsufficientPersmission());
      } else {
        return const Left(Unexpected());
      }
    } catch (e) {
      return const Left(Unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) async {
    try {
      final userDoc = await _firebaseFirestore.userDocument();

      await userDoc.noteCollection.doc(note.id.getOrCrash()).delete();

      return const Right(unit);
    } on PlatformException catch (e) {
      if (e.message?.contains('PERMISSION_DENIED') == true) {
        return const Left(InsufficientPersmission());
      } else {
        return const Left(Unexpected());
      }
    } catch (e) {
      return const Left(Unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {
    try {
      final userDoc = await _firebaseFirestore.userDocument();
      final noteDTO = NoteDTO.fromDomain(note);

      await userDoc.noteCollection
          .doc(note.id.getOrCrash())
          .update(noteDTO.toJson());

      return const Right(unit);
    } on PlatformException catch (e) {
      if (e.message?.contains('PERMISSION_DENIED') == true) {
        return const Left(InsufficientPersmission());
      } else {
        return const Left(Unexpected());
      }
    } catch (e) {
      return const Left(Unexpected());
    }
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    final userDoc = await _firebaseFirestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map<Either<NoteFailure, KtList<Note>>>(
          (snapshot) => Right(
            snapshot.docs
                .map((doc) => NoteDTO.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith(
      (e, stacktrace) {
        if (e is PlatformException &&
            e.message?.contains('permission_denied') == true) {
          return const Left(InsufficientPersmission());
        } else {
          return const Left(Unexpected());
        }
      },
    );
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {
    final userDoc = await _firebaseFirestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => NoteDTO.fromFirestore(doc).toDomain()),
        )
        .map<Either<NoteFailure, KtList<Note>>>(
          (notes) => Right(notes
              .where((note) =>
                  note.todos.getOrCrash().any((todoItem) => !todoItem.done))
              .toImmutableList()),
        )
        .onErrorReturnWith(
      (e, stacktrace) {
        if (e is PlatformException &&
            e.message?.contains('permission_denied') == true) {
          return const Left(InsufficientPersmission());
        } else {
          return const Left(Unexpected());
        }
      },
    );
  }
}
