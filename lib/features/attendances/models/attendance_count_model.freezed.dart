// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceCountModel _$AttendanceCountModelFromJson(Map<String, dynamic> json) {
  return _AttendanceCountModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceCountModel {
  int? get p => throw _privateConstructorUsedError;
  int? get l => throw _privateConstructorUsedError;
  int? get a => throw _privateConstructorUsedError;

  /// Serializes this AttendanceCountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceCountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceCountModelCopyWith<AttendanceCountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCountModelCopyWith<$Res> {
  factory $AttendanceCountModelCopyWith(AttendanceCountModel value,
          $Res Function(AttendanceCountModel) then) =
      _$AttendanceCountModelCopyWithImpl<$Res, AttendanceCountModel>;
  @useResult
  $Res call({int? p, int? l, int? a});
}

/// @nodoc
class _$AttendanceCountModelCopyWithImpl<$Res,
        $Val extends AttendanceCountModel>
    implements $AttendanceCountModelCopyWith<$Res> {
  _$AttendanceCountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceCountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? p = freezed,
    Object? l = freezed,
    Object? a = freezed,
  }) {
    return _then(_value.copyWith(
      p: freezed == p
          ? _value.p
          : p // ignore: cast_nullable_to_non_nullable
              as int?,
      l: freezed == l
          ? _value.l
          : l // ignore: cast_nullable_to_non_nullable
              as int?,
      a: freezed == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceCountModelImplCopyWith<$Res>
    implements $AttendanceCountModelCopyWith<$Res> {
  factory _$$AttendanceCountModelImplCopyWith(_$AttendanceCountModelImpl value,
          $Res Function(_$AttendanceCountModelImpl) then) =
      __$$AttendanceCountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? p, int? l, int? a});
}

/// @nodoc
class __$$AttendanceCountModelImplCopyWithImpl<$Res>
    extends _$AttendanceCountModelCopyWithImpl<$Res, _$AttendanceCountModelImpl>
    implements _$$AttendanceCountModelImplCopyWith<$Res> {
  __$$AttendanceCountModelImplCopyWithImpl(_$AttendanceCountModelImpl _value,
      $Res Function(_$AttendanceCountModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceCountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? p = freezed,
    Object? l = freezed,
    Object? a = freezed,
  }) {
    return _then(_$AttendanceCountModelImpl(
      p: freezed == p
          ? _value.p
          : p // ignore: cast_nullable_to_non_nullable
              as int?,
      l: freezed == l
          ? _value.l
          : l // ignore: cast_nullable_to_non_nullable
              as int?,
      a: freezed == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceCountModelImpl implements _AttendanceCountModel {
  _$AttendanceCountModelImpl({this.p, this.l, this.a});

  factory _$AttendanceCountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceCountModelImplFromJson(json);

  @override
  final int? p;
  @override
  final int? l;
  @override
  final int? a;

  @override
  String toString() {
    return 'AttendanceCountModel(p: $p, l: $l, a: $a)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceCountModelImpl &&
            (identical(other.p, p) || other.p == p) &&
            (identical(other.l, l) || other.l == l) &&
            (identical(other.a, a) || other.a == a));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, p, l, a);

  /// Create a copy of AttendanceCountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceCountModelImplCopyWith<_$AttendanceCountModelImpl>
      get copyWith =>
          __$$AttendanceCountModelImplCopyWithImpl<_$AttendanceCountModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceCountModelImplToJson(
      this,
    );
  }
}

abstract class _AttendanceCountModel implements AttendanceCountModel {
  factory _AttendanceCountModel({final int? p, final int? l, final int? a}) =
      _$AttendanceCountModelImpl;

  factory _AttendanceCountModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceCountModelImpl.fromJson;

  @override
  int? get p;
  @override
  int? get l;
  @override
  int? get a;

  /// Create a copy of AttendanceCountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceCountModelImplCopyWith<_$AttendanceCountModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
