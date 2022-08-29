import 'package:dartz/dartz.dart';
import 'package:notes_firebase_ddd_course/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd_course/domain/auth/user.dart';
import 'package:notes_firebase_ddd_course/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Option<UserEntity>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress email,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress email,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoggle();

  Future<void> signOut();
}
