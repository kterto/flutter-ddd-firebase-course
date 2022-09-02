// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() insufficientPersmission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? insufficientPersmission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? insufficientPersmission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(InsufficientPersmission value)
        insufficientPersmission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    TResult Function(InsufficientPersmission value)? insufficientPersmission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    TResult Function(InsufficientPersmission value)? insufficientPersmission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteFailureCopyWith<$Res> {
  factory $NoteFailureCopyWith(
          NoteFailure value, $Res Function(NoteFailure) then) =
      _$NoteFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoteFailureCopyWithImpl<$Res> implements $NoteFailureCopyWith<$Res> {
  _$NoteFailureCopyWithImpl(this._value, this._then);

  final NoteFailure _value;
  // ignore: unused_field
  final $Res Function(NoteFailure) _then;
}

/// @nodoc
abstract class _$$UnexpectedCopyWith<$Res> {
  factory _$$UnexpectedCopyWith(
          _$Unexpected value, $Res Function(_$Unexpected) then) =
      __$$UnexpectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnexpectedCopyWithImpl<$Res> extends _$NoteFailureCopyWithImpl<$Res>
    implements _$$UnexpectedCopyWith<$Res> {
  __$$UnexpectedCopyWithImpl(
      _$Unexpected _value, $Res Function(_$Unexpected) _then)
      : super(_value, (v) => _then(v as _$Unexpected));

  @override
  _$Unexpected get _value => super._value as _$Unexpected;
}

/// @nodoc

class _$Unexpected implements Unexpected {
  const _$Unexpected();

  @override
  String toString() {
    return 'NoteFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() insufficientPersmission,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? insufficientPersmission,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? insufficientPersmission,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(InsufficientPersmission value)
        insufficientPersmission,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    TResult Function(InsufficientPersmission value)? insufficientPersmission,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    TResult Function(InsufficientPersmission value)? insufficientPersmission,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class Unexpected implements NoteFailure {
  const factory Unexpected() = _$Unexpected;
}

/// @nodoc
abstract class _$$InsufficientPersmissionCopyWith<$Res> {
  factory _$$InsufficientPersmissionCopyWith(_$InsufficientPersmission value,
          $Res Function(_$InsufficientPersmission) then) =
      __$$InsufficientPersmissionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InsufficientPersmissionCopyWithImpl<$Res>
    extends _$NoteFailureCopyWithImpl<$Res>
    implements _$$InsufficientPersmissionCopyWith<$Res> {
  __$$InsufficientPersmissionCopyWithImpl(_$InsufficientPersmission _value,
      $Res Function(_$InsufficientPersmission) _then)
      : super(_value, (v) => _then(v as _$InsufficientPersmission));

  @override
  _$InsufficientPersmission get _value =>
      super._value as _$InsufficientPersmission;
}

/// @nodoc

class _$InsufficientPersmission implements InsufficientPersmission {
  const _$InsufficientPersmission();

  @override
  String toString() {
    return 'NoteFailure.insufficientPersmission()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsufficientPersmission);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() insufficientPersmission,
  }) {
    return insufficientPersmission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? insufficientPersmission,
  }) {
    return insufficientPersmission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? insufficientPersmission,
    required TResult orElse(),
  }) {
    if (insufficientPersmission != null) {
      return insufficientPersmission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unexpected value) unexpected,
    required TResult Function(InsufficientPersmission value)
        insufficientPersmission,
  }) {
    return insufficientPersmission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    TResult Function(InsufficientPersmission value)? insufficientPersmission,
  }) {
    return insufficientPersmission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    TResult Function(InsufficientPersmission value)? insufficientPersmission,
    required TResult orElse(),
  }) {
    if (insufficientPersmission != null) {
      return insufficientPersmission(this);
    }
    return orElse();
  }
}

abstract class InsufficientPersmission implements NoteFailure {
  const factory InsufficientPersmission() = _$InsufficientPersmission;
}
