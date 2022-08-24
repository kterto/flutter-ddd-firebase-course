import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFaiure with _$AuthFaiure {
  const factory AuthFaiure.canceledByUser() = CanceledByUser;
  const factory AuthFaiure.serverError() = ServerError;
  const factory AuthFaiure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFaiure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}
