// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) {
  return _ScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$ScheduleModel {
  int? get id => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  int? get courseId => throw _privateConstructorUsedError;
  CourseModel? get courseModel => throw _privateConstructorUsedError;
  String? get colorCode => throw _privateConstructorUsedError;
  int? get createdBy => throw _privateConstructorUsedError;
  UserModel? get createdByModel => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;

  /// Serializes this ScheduleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleModelCopyWith<ScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleModelCopyWith<$Res> {
  factory $ScheduleModelCopyWith(
          ScheduleModel value, $Res Function(ScheduleModel) then) =
      _$ScheduleModelCopyWithImpl<$Res, ScheduleModel>;
  @useResult
  $Res call(
      {int? id,
      DateTime? startTime,
      DateTime? endTime,
      int? courseId,
      CourseModel? courseModel,
      String? colorCode,
      int? createdBy,
      UserModel? createdByModel,
      DateTime? createdDate});

  $CourseModelCopyWith<$Res>? get courseModel;
  $UserModelCopyWith<$Res>? get createdByModel;
}

/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res, $Val extends ScheduleModel>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? courseId = freezed,
    Object? courseModel = freezed,
    Object? colorCode = freezed,
    Object? createdBy = freezed,
    Object? createdByModel = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseModel: freezed == courseModel
          ? _value.courseModel
          : courseModel // ignore: cast_nullable_to_non_nullable
              as CourseModel?,
      colorCode: freezed == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdByModel: freezed == createdByModel
          ? _value.createdByModel
          : createdByModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseModelCopyWith<$Res>? get courseModel {
    if (_value.courseModel == null) {
      return null;
    }

    return $CourseModelCopyWith<$Res>(_value.courseModel!, (value) {
      return _then(_value.copyWith(courseModel: value) as $Val);
    });
  }

  /// Create a copy of ScheduleModel
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
}

/// @nodoc
abstract class _$$ScheduleModelImplCopyWith<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  factory _$$ScheduleModelImplCopyWith(
          _$ScheduleModelImpl value, $Res Function(_$ScheduleModelImpl) then) =
      __$$ScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      DateTime? startTime,
      DateTime? endTime,
      int? courseId,
      CourseModel? courseModel,
      String? colorCode,
      int? createdBy,
      UserModel? createdByModel,
      DateTime? createdDate});

  @override
  $CourseModelCopyWith<$Res>? get courseModel;
  @override
  $UserModelCopyWith<$Res>? get createdByModel;
}

/// @nodoc
class __$$ScheduleModelImplCopyWithImpl<$Res>
    extends _$ScheduleModelCopyWithImpl<$Res, _$ScheduleModelImpl>
    implements _$$ScheduleModelImplCopyWith<$Res> {
  __$$ScheduleModelImplCopyWithImpl(
      _$ScheduleModelImpl _value, $Res Function(_$ScheduleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? courseId = freezed,
    Object? courseModel = freezed,
    Object? colorCode = freezed,
    Object? createdBy = freezed,
    Object? createdByModel = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$ScheduleModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseModel: freezed == courseModel
          ? _value.courseModel
          : courseModel // ignore: cast_nullable_to_non_nullable
              as CourseModel?,
      colorCode: freezed == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdByModel: freezed == createdByModel
          ? _value.createdByModel
          : createdByModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleModelImpl implements _ScheduleModel {
  _$ScheduleModelImpl(
      {this.id,
      this.startTime,
      this.endTime,
      this.courseId,
      this.courseModel,
      this.colorCode,
      this.createdBy,
      this.createdByModel,
      this.createdDate});

  factory _$ScheduleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleModelImplFromJson(json);

  @override
  final int? id;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  final int? courseId;
  @override
  final CourseModel? courseModel;
  @override
  final String? colorCode;
  @override
  final int? createdBy;
  @override
  final UserModel? createdByModel;
  @override
  final DateTime? createdDate;

  @override
  String toString() {
    return 'ScheduleModel(id: $id, startTime: $startTime, endTime: $endTime, courseId: $courseId, courseModel: $courseModel, colorCode: $colorCode, createdBy: $createdBy, createdByModel: $createdByModel, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.courseModel, courseModel) ||
                other.courseModel == courseModel) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdByModel, createdByModel) ||
                other.createdByModel == createdByModel) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, startTime, endTime, courseId,
      courseModel, colorCode, createdBy, createdByModel, createdDate);

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      __$$ScheduleModelImplCopyWithImpl<_$ScheduleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleModelImplToJson(
      this,
    );
  }
}

abstract class _ScheduleModel implements ScheduleModel {
  factory _ScheduleModel(
      {final int? id,
      final DateTime? startTime,
      final DateTime? endTime,
      final int? courseId,
      final CourseModel? courseModel,
      final String? colorCode,
      final int? createdBy,
      final UserModel? createdByModel,
      final DateTime? createdDate}) = _$ScheduleModelImpl;

  factory _ScheduleModel.fromJson(Map<String, dynamic> json) =
      _$ScheduleModelImpl.fromJson;

  @override
  int? get id;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  int? get courseId;
  @override
  CourseModel? get courseModel;
  @override
  String? get colorCode;
  @override
  int? get createdBy;
  @override
  UserModel? get createdByModel;
  @override
  DateTime? get createdDate;

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
