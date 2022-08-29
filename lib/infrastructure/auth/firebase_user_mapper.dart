import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_firebase_ddd_course/domain/auth/user.dart';
import 'package:notes_firebase_ddd_course/domain/core/value_objects.dart';

extension FirebaseDomainX on User {
  UserEntity toDomain() {
    return UserEntity(id: UniqueId.fromUniqueString(uid));
  }
}
