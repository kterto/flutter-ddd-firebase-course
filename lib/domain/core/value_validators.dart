import 'package:dartz/dartz.dart';
import 'package:notes_firebase_ddd_course/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$""";

  if (RegExp(emailRegex).hasMatch(input)) {
    return Right(input);
  } else {
    return Left(
      InvalidEmail(failedValue: input),
    );
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return Right(input);
  } else {
    return Left(
      ShortPassword(failedValue: input),
    );
  }
}
