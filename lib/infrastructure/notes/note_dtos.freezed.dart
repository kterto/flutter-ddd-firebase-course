// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteDTO _$NoteDTOFromJson(Map<String, dynamic> json) {
  return _NoteDTO.fromJson(json);
}

/// @nodoc
mixin _$NoteDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  List<TodoItemDTO> get todos => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteDTOCopyWith<NoteDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDTOCopyWith<$Res> {
  factory $NoteDTOCopyWith(NoteDTO value, $Res Function(NoteDTO) then) =
      _$NoteDTOCopyWithImpl<$Res, NoteDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String body,
      int color,
      List<TodoItemDTO> todos,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class _$NoteDTOCopyWithImpl<$Res, $Val extends NoteDTO>
    implements $NoteDTOCopyWith<$Res> {
  _$NoteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? body = null,
    Object? color = null,
    Object? todos = null,
    Object? serverTimeStamp = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoItemDTO>,
      serverTimeStamp: null == serverTimeStamp
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoteDTOCopyWith<$Res> implements $NoteDTOCopyWith<$Res> {
  factory _$$_NoteDTOCopyWith(
          _$_NoteDTO value, $Res Function(_$_NoteDTO) then) =
      __$$_NoteDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String body,
      int color,
      List<TodoItemDTO> todos,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class __$$_NoteDTOCopyWithImpl<$Res>
    extends _$NoteDTOCopyWithImpl<$Res, _$_NoteDTO>
    implements _$$_NoteDTOCopyWith<$Res> {
  __$$_NoteDTOCopyWithImpl(_$_NoteDTO _value, $Res Function(_$_NoteDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? body = null,
    Object? color = null,
    Object? todos = null,
    Object? serverTimeStamp = null,
  }) {
    return _then(_$_NoteDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoItemDTO>,
      serverTimeStamp: null == serverTimeStamp
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NoteDTO extends _NoteDTO {
  const _$_NoteDTO(
      {@JsonKey(ignore: true) this.id,
      required this.body,
      required this.color,
      required final List<TodoItemDTO> todos,
      @ServerTimestampConverter() required this.serverTimeStamp})
      : _todos = todos,
        super._();

  factory _$_NoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_NoteDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String body;
  @override
  final int color;
  final List<TodoItemDTO> _todos;
  @override
  List<TodoItemDTO> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;

  @override
  String toString() {
    return 'NoteDTO(id: $id, body: $body, color: $color, todos: $todos, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.serverTimeStamp, serverTimeStamp) ||
                other.serverTimeStamp == serverTimeStamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, body, color,
      const DeepCollectionEquality().hash(_todos), serverTimeStamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteDTOCopyWith<_$_NoteDTO> get copyWith =>
      __$$_NoteDTOCopyWithImpl<_$_NoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteDTOToJson(
      this,
    );
  }
}

abstract class _NoteDTO extends NoteDTO {
  const factory _NoteDTO(
      {@JsonKey(ignore: true)
          final String? id,
      required final String body,
      required final int color,
      required final List<TodoItemDTO> todos,
      @ServerTimestampConverter()
          required final FieldValue serverTimeStamp}) = _$_NoteDTO;
  const _NoteDTO._() : super._();

  factory _NoteDTO.fromJson(Map<String, dynamic> json) = _$_NoteDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get body;
  @override
  int get color;
  @override
  List<TodoItemDTO> get todos;
  @override
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$$_NoteDTOCopyWith<_$_NoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

TodoItemDTO _$TodoItemDTOFromJson(Map<String, dynamic> json) {
  return _TodoItemDTO.fromJson(json);
}

/// @nodoc
mixin _$TodoItemDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoItemDTOCopyWith<TodoItemDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemDTOCopyWith<$Res> {
  factory $TodoItemDTOCopyWith(
          TodoItemDTO value, $Res Function(TodoItemDTO) then) =
      _$TodoItemDTOCopyWithImpl<$Res, TodoItemDTO>;
  @useResult
  $Res call({String id, String name, bool done});
}

/// @nodoc
class _$TodoItemDTOCopyWithImpl<$Res, $Val extends TodoItemDTO>
    implements $TodoItemDTOCopyWith<$Res> {
  _$TodoItemDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? done = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoItemDTOCopyWith<$Res>
    implements $TodoItemDTOCopyWith<$Res> {
  factory _$$_TodoItemDTOCopyWith(
          _$_TodoItemDTO value, $Res Function(_$_TodoItemDTO) then) =
      __$$_TodoItemDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, bool done});
}

/// @nodoc
class __$$_TodoItemDTOCopyWithImpl<$Res>
    extends _$TodoItemDTOCopyWithImpl<$Res, _$_TodoItemDTO>
    implements _$$_TodoItemDTOCopyWith<$Res> {
  __$$_TodoItemDTOCopyWithImpl(
      _$_TodoItemDTO _value, $Res Function(_$_TodoItemDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? done = null,
  }) {
    return _then(_$_TodoItemDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoItemDTO extends _TodoItemDTO {
  const _$_TodoItemDTO(
      {required this.id, required this.name, required this.done})
      : super._();

  factory _$_TodoItemDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TodoItemDTOFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool done;

  @override
  String toString() {
    return 'TodoItemDTO(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoItemDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.done, done) || other.done == done));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, done);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoItemDTOCopyWith<_$_TodoItemDTO> get copyWith =>
      __$$_TodoItemDTOCopyWithImpl<_$_TodoItemDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoItemDTOToJson(
      this,
    );
  }
}

abstract class _TodoItemDTO extends TodoItemDTO {
  const factory _TodoItemDTO(
      {required final String id,
      required final String name,
      required final bool done}) = _$_TodoItemDTO;
  const _TodoItemDTO._() : super._();

  factory _TodoItemDTO.fromJson(Map<String, dynamic> json) =
      _$_TodoItemDTO.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$$_TodoItemDTOCopyWith<_$_TodoItemDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
