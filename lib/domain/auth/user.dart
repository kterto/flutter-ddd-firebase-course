import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_firebase_ddd_course/domain/core/value_objects.dart';

part 'user.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required UniqueId id,
  }) = _UserEntity;
}
