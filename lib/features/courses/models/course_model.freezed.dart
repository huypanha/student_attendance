// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) {
  return _CourseModel.fromJson(json);
}

/// @nodoc
mixin _$CourseModel {
  int? get id => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  int? get teacherId => throw _privateConstructorUsedError;
  UserModel? get teacherModel => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  int? get createdBy => throw _privateConstructorUsedError;
  UserModel? get createdByModel => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  int? get updatedBy => throw _privateConstructorUsedError;
  UserModel? get updatedByModel => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<UserModel>? get students => throw _privateConstructorUsedError;
  List<int>? get studentIds => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this CourseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseModelCopyWith<CourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseModelCopyWith<$Res> {
  factory $CourseModelCopyWith(
          CourseModel value, $Res Function(CourseModel) then) =
      _$CourseModelCopyWithImpl<$Res, CourseModel>;
  @useResult
  $Res call(
      {int? id,
      String? subject,
      int? teacherId,
      UserModel? teacherModel,
      String? description,
      String? img,
      int? createdBy,
      UserModel? createdByModel,
      DateTime? createdAt,
      int? updatedBy,
      UserModel? updatedByModel,
      DateTime? updatedAt,
      List<UserModel>? students,
      List<int>? studentIds,
      String? status});

  $UserModelCopyWith<$Res>? get teacherModel;
  $UserModelCopyWith<$Res>? get createdByModel;
  $UserModelCopyWith<$Res>? get updatedByModel;
}

/// @nodoc
class _$CourseModelCopyWithImpl<$Res, $Val extends CourseModel>
    implements $CourseModelCopyWith<$Res> {
  _$CourseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? subject = freezed,
    Object? teacherId = freezed,
    Object? teacherModel = freezed,
    Object? description = freezed,
    Object? img = freezed,
    Object? createdBy = freezed,
    Object? createdByModel = freezed,
    Object? createdAt = freezed,
    Object? updatedBy = freezed,
    Object? updatedByModel = freezed,
    Object? updatedAt = freezed,
    Object? students = freezed,
    Object? studentIds = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherModel: freezed == teacherModel
          ? _value.teacherModel
          : teacherModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdByModel: freezed == createdByModel
          ? _value.createdByModel
          : createdByModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedByModel: freezed == updatedByModel
          ? _value.updatedByModel
          : updatedByModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      students: freezed == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
      studentIds: freezed == studentIds
          ? _value.studentIds
          : studentIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get teacherModel {
    if (_value.teacherModel == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.teacherModel!, (value) {
      return _then(_value.copyWith(teacherModel: value) as $Val);
    });
  }

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get createdByModel {
    if (_value.createdByModel == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.createdByModel!, (value) {
      return _then(_value.copyWith(createdByModel: value) as $Val);
    });
  }

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get updatedByModel {
    if (_value.updatedByModel == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.updatedByModel!, (value) {
      return _then(_value.copyWith(updatedByModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseModelImplCopyWith<$Res>
    implements $CourseModelCopyWith<$Res> {
  factory _$$CourseModelImplCopyWith(
          _$CourseModelImpl value, $Res Function(_$CourseModelImpl) then) =
      __$$CourseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? subject,
      int? teacherId,
      UserModel? teacherModel,
      String? description,
      String? img,
      int? createdBy,
      UserModel? createdByModel,
      DateTime? createdAt,
      int? updatedBy,
      UserModel? updatedByModel,
      DateTime? updatedAt,
      List<UserModel>? students,
      List<int>? studentIds,
      String? status});

  @override
  $UserModelCopyWith<$Res>? get teacherModel;
  @override
  $UserModelCopyWith<$Res>? get createdByModel;
  @override
  $UserModelCopyWith<$Res>? get updatedByModel;
}

/// @nodoc
class __$$CourseModelImplCopyWithImpl<$Res>
    extends _$CourseModelCopyWithImpl<$Res, _$CourseModelImpl>
    implements _$$CourseModelImplCopyWith<$Res> {
  __$$CourseModelImplCopyWithImpl(
      _$CourseModelImpl _value, $Res Function(_$CourseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? subject = freezed,
    Object? teacherId = freezed,
    Object? teacherModel = freezed,
    Object? description = freezed,
    Object? img = freezed,
    Object? createdBy = freezed,
    Object? createdByModel = freezed,
    Object? createdAt = freezed,
    Object? updatedBy = freezed,
    Object? updatedByModel = freezed,
    Object? updatedAt = freezed,
    Object? students = freezed,
    Object? studentIds = freezed,
    Object? status = freezed,
  }) {
    return _then(_$CourseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherModel: freezed == teacherModel
          ? _value.teacherModel
          : teacherModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdByModel: freezed == createdByModel
          ? _value.createdByModel
          : createdByModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedByModel: freezed == updatedByModel
          ? _value.updatedByModel
          : updatedByModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      students: freezed == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
      studentIds: freezed == studentIds
          ? _value._studentIds
          : studentIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseModelImpl implements _CourseModel {
  _$CourseModelImpl(
      {this.id,
      this.subject,
      this.teacherId,
      this.teacherModel,
      this.description,
      this.img,
      this.createdBy,
      this.createdByModel,
      this.createdAt,
      this.updatedBy,
      this.updatedByModel,
      this.updatedAt,
      final List<UserModel>? students = const [],
      final List<int>? studentIds = const [],
      this.status = 'A'})
      : _students = students,
        _studentIds = studentIds;

  factory _$CourseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? subject;
  @override
  final int? teacherId;
  @override
  final UserModel? teacherModel;
  @override
  final String? description;
  @override
  final String? img;
  @override
  final int? createdBy;
  @override
  final UserModel? createdByModel;
  @override
  final DateTime? createdAt;
  @override
  final int? updatedBy;
  @override
  final UserModel? updatedByModel;
  @override
  final DateTime? updatedAt;
  final List<UserModel>? _students;
  @override
  @JsonKey()
  List<UserModel>? get students {
    final value = _students;
    if (value == null) return null;
    if (_students is EqualUnmodifiableListView) return _students;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _studentIds;
  @override
  @JsonKey()
  List<int>? get studentIds {
    final value = _studentIds;
    if (value == null) return null;
    if (_studentIds is EqualUnmodifiableListView) return _studentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String? status;

  @override
  String toString() {
    return 'CourseModel(id: $id, subject: $subject, teacherId: $teacherId, teacherModel: $teacherModel, description: $description, img: $img, createdBy: $createdBy, createdByModel: $createdByModel, createdAt: $createdAt, updatedBy: $updatedBy, updatedByModel: $updatedByModel, updatedAt: $updatedAt, students: $students, studentIds: $studentIds, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.teacherModel, teacherModel) ||
                other.teacherModel == teacherModel) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdByModel, createdByModel) ||
                other.createdByModel == createdByModel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedByModel, updatedByModel) ||
                other.updatedByModel == updatedByModel) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            const DeepCollectionEquality()
                .equals(other._studentIds, _studentIds) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      subject,
      teacherId,
      teacherModel,
      description,
      img,
      createdBy,
      createdByModel,
      createdAt,
      updatedBy,
      updatedByModel,
      updatedAt,
      const DeepCollectionEquality().hash(_students),
      const DeepCollectionEquality().hash(_studentIds),
      status);

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseModelImplCopyWith<_$CourseModelImpl> get copyWith =>
      __$$CourseModelImplCopyWithImpl<_$CourseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseModelImplToJson(
      this,
    );
  }
}

abstract class _CourseModel implements CourseModel {
  factory _CourseModel(
      {final int? id,
      final String? subject,
      final int? teacherId,
      final UserModel? teacherModel,
      final String? description,
      final String? img,
      final int? createdBy,
      final UserModel? createdByModel,
      final DateTime? createdAt,
      final int? updatedBy,
      final UserModel? updatedByModel,
      final DateTime? updatedAt,
      final List<UserModel>? students,
      final List<int>? studentIds,
      final String? status}) = _$CourseModelImpl;

  factory _CourseModel.fromJson(Map<String, dynamic> json) =
      _$CourseModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get subject;
  @override
  int? get teacherId;
  @override
  UserModel? get teacherModel;
  @override
  String? get description;
  @override
  String? get img;
  @override
  int? get createdBy;
  @override
  UserModel? get createdByModel;
  @override
  DateTime? get createdAt;
  @override
  int? get updatedBy;
  @override
  UserModel? get updatedByModel;
  @override
  DateTime? get updatedAt;
  @override
  List<UserModel>? get students;
  @override
  List<int>? get studentIds;
  @override
  String? get status;

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseModelImplCopyWith<_$CourseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
