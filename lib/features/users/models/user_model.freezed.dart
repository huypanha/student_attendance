// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int? get id => throw _privateConstructorUsedError;
  String? get stuId => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  @UserTypeEnumConverter()
  UserType? get type =>
      throw _privateConstructorUsedError; // 0: for teacher, 1: for student
  int? get createdBy => throw _privateConstructorUsedError;
  int? get updatedBy => throw _privateConstructorUsedError;
  UserModel? get createdByModel => throw _privateConstructorUsedError;
  UserModel? get updatedByModel => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get lastActive => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  AttendanceCountModel? get attendanceCount =>
      throw _privateConstructorUsedError;
  List<CourseModel>? get courses => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  List<AttendanceModel>? get attendances => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int? id,
      String? stuId,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? phoneNumber,
      DateTime? dob,
      @UserTypeEnumConverter() UserType? type,
      int? createdBy,
      int? updatedBy,
      UserModel? createdByModel,
      UserModel? updatedByModel,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? lastActive,
      String? accessToken,
      AttendanceCountModel? attendanceCount,
      List<CourseModel>? courses,
      String? status,
      List<AttendanceModel>? attendances});

  $UserModelCopyWith<$Res>? get createdByModel;
  $UserModelCopyWith<$Res>? get updatedByModel;
  $AttendanceCountModelCopyWith<$Res>? get attendanceCount;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stuId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneNumber = freezed,
    Object? dob = freezed,
    Object? type = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdByModel = freezed,
    Object? updatedByModel = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lastActive = freezed,
    Object? accessToken = freezed,
    Object? attendanceCount = freezed,
    Object? courses = freezed,
    Object? status = freezed,
    Object? attendances = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stuId: freezed == stuId
          ? _value.stuId
          : stuId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserType?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdByModel: freezed == createdByModel
          ? _value.createdByModel
          : createdByModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      updatedByModel: freezed == updatedByModel
          ? _value.updatedByModel
          : updatedByModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastActive: freezed == lastActive
          ? _value.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceCount: freezed == attendanceCount
          ? _value.attendanceCount
          : attendanceCount // ignore: cast_nullable_to_non_nullable
              as AttendanceCountModel?,
      courses: freezed == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      attendances: freezed == attendances
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<AttendanceModel>?,
    ) as $Val);
  }

  /// Create a copy of UserModel
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

  /// Create a copy of UserModel
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

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttendanceCountModelCopyWith<$Res>? get attendanceCount {
    if (_value.attendanceCount == null) {
      return null;
    }

    return $AttendanceCountModelCopyWith<$Res>(_value.attendanceCount!,
        (value) {
      return _then(_value.copyWith(attendanceCount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? stuId,
      String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? phoneNumber,
      DateTime? dob,
      @UserTypeEnumConverter() UserType? type,
      int? createdBy,
      int? updatedBy,
      UserModel? createdByModel,
      UserModel? updatedByModel,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? lastActive,
      String? accessToken,
      AttendanceCountModel? attendanceCount,
      List<CourseModel>? courses,
      String? status,
      List<AttendanceModel>? attendances});

  @override
  $UserModelCopyWith<$Res>? get createdByModel;
  @override
  $UserModelCopyWith<$Res>? get updatedByModel;
  @override
  $AttendanceCountModelCopyWith<$Res>? get attendanceCount;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stuId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneNumber = freezed,
    Object? dob = freezed,
    Object? type = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdByModel = freezed,
    Object? updatedByModel = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lastActive = freezed,
    Object? accessToken = freezed,
    Object? attendanceCount = freezed,
    Object? courses = freezed,
    Object? status = freezed,
    Object? attendances = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stuId: freezed == stuId
          ? _value.stuId
          : stuId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserType?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdByModel: freezed == createdByModel
          ? _value.createdByModel
          : createdByModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      updatedByModel: freezed == updatedByModel
          ? _value.updatedByModel
          : updatedByModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastActive: freezed == lastActive
          ? _value.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceCount: freezed == attendanceCount
          ? _value.attendanceCount
          : attendanceCount // ignore: cast_nullable_to_non_nullable
              as AttendanceCountModel?,
      courses: freezed == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      attendances: freezed == attendances
          ? _value._attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<AttendanceModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.id,
      this.stuId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phoneNumber,
      this.dob,
      @UserTypeEnumConverter() this.type,
      this.createdBy,
      this.updatedBy,
      this.createdByModel,
      this.updatedByModel,
      this.createdAt,
      this.updatedAt,
      this.lastActive,
      this.accessToken,
      this.attendanceCount,
      final List<CourseModel>? courses = const <CourseModel>[],
      this.status = 'A',
      final List<AttendanceModel>? attendances = const <AttendanceModel>[]})
      : _courses = courses,
        _attendances = attendances;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? stuId;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? phoneNumber;
  @override
  final DateTime? dob;
  @override
  @UserTypeEnumConverter()
  final UserType? type;
// 0: for teacher, 1: for student
  @override
  final int? createdBy;
  @override
  final int? updatedBy;
  @override
  final UserModel? createdByModel;
  @override
  final UserModel? updatedByModel;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? lastActive;
  @override
  final String? accessToken;
  @override
  final AttendanceCountModel? attendanceCount;
  final List<CourseModel>? _courses;
  @override
  @JsonKey()
  List<CourseModel>? get courses {
    final value = _courses;
    if (value == null) return null;
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String? status;
  final List<AttendanceModel>? _attendances;
  @override
  @JsonKey()
  List<AttendanceModel>? get attendances {
    final value = _attendances;
    if (value == null) return null;
    if (_attendances is EqualUnmodifiableListView) return _attendances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, stuId: $stuId, firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneNumber: $phoneNumber, dob: $dob, type: $type, createdBy: $createdBy, updatedBy: $updatedBy, createdByModel: $createdByModel, updatedByModel: $updatedByModel, createdAt: $createdAt, updatedAt: $updatedAt, lastActive: $lastActive, accessToken: $accessToken, attendanceCount: $attendanceCount, courses: $courses, status: $status, attendances: $attendances)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stuId, stuId) || other.stuId == stuId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.createdByModel, createdByModel) ||
                other.createdByModel == createdByModel) &&
            (identical(other.updatedByModel, updatedByModel) ||
                other.updatedByModel == updatedByModel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lastActive, lastActive) ||
                other.lastActive == lastActive) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.attendanceCount, attendanceCount) ||
                other.attendanceCount == attendanceCount) &&
            const DeepCollectionEquality().equals(other._courses, _courses) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._attendances, _attendances));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        stuId,
        firstName,
        lastName,
        email,
        password,
        phoneNumber,
        dob,
        type,
        createdBy,
        updatedBy,
        createdByModel,
        updatedByModel,
        createdAt,
        updatedAt,
        lastActive,
        accessToken,
        attendanceCount,
        const DeepCollectionEquality().hash(_courses),
        status,
        const DeepCollectionEquality().hash(_attendances)
      ]);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final int? id,
      final String? stuId,
      final String? firstName,
      final String? lastName,
      final String? email,
      final String? password,
      final String? phoneNumber,
      final DateTime? dob,
      @UserTypeEnumConverter() final UserType? type,
      final int? createdBy,
      final int? updatedBy,
      final UserModel? createdByModel,
      final UserModel? updatedByModel,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final DateTime? lastActive,
      final String? accessToken,
      final AttendanceCountModel? attendanceCount,
      final List<CourseModel>? courses,
      final String? status,
      final List<AttendanceModel>? attendances}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get stuId;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get phoneNumber;
  @override
  DateTime? get dob;
  @override
  @UserTypeEnumConverter()
  UserType? get type; // 0: for teacher, 1: for student
  @override
  int? get createdBy;
  @override
  int? get updatedBy;
  @override
  UserModel? get createdByModel;
  @override
  UserModel? get updatedByModel;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get lastActive;
  @override
  String? get accessToken;
  @override
  AttendanceCountModel? get attendanceCount;
  @override
  List<CourseModel>? get courses;
  @override
  String? get status;
  @override
  List<AttendanceModel>? get attendances;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
