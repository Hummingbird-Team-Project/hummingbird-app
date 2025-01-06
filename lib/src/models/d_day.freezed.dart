// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'd_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DDay _$DDayFromJson(Map<String, dynamic> json) {
  return _DDay.fromJson(json);
}

/// @nodoc
mixin _$DDay {
  @HiveField(0)
  String get goalTitle => throw _privateConstructorUsedError;
  @HiveField(1)
  String get goalDate => throw _privateConstructorUsedError;
  @HiveField(2)
  String get createDate => throw _privateConstructorUsedError;
  @HiveField(3)
  String get color => throw _privateConstructorUsedError;
  @HiveField(4)
  int get state => throw _privateConstructorUsedError;

  /// Serializes this DDay to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DDayCopyWith<DDay> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DDayCopyWith<$Res> {
  factory $DDayCopyWith(DDay value, $Res Function(DDay) then) =
      _$DDayCopyWithImpl<$Res, DDay>;
  @useResult
  $Res call(
      {@HiveField(0) String goalTitle,
      @HiveField(1) String goalDate,
      @HiveField(2) String createDate,
      @HiveField(3) String color,
      @HiveField(4) int state});
}

/// @nodoc
class _$DDayCopyWithImpl<$Res, $Val extends DDay>
    implements $DDayCopyWith<$Res> {
  _$DDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goalTitle = null,
    Object? goalDate = null,
    Object? createDate = null,
    Object? color = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      goalTitle: null == goalTitle
          ? _value.goalTitle
          : goalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      goalDate: null == goalDate
          ? _value.goalDate
          : goalDate // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DDayImplCopyWith<$Res> implements $DDayCopyWith<$Res> {
  factory _$$DDayImplCopyWith(
          _$DDayImpl value, $Res Function(_$DDayImpl) then) =
      __$$DDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String goalTitle,
      @HiveField(1) String goalDate,
      @HiveField(2) String createDate,
      @HiveField(3) String color,
      @HiveField(4) int state});
}

/// @nodoc
class __$$DDayImplCopyWithImpl<$Res>
    extends _$DDayCopyWithImpl<$Res, _$DDayImpl>
    implements _$$DDayImplCopyWith<$Res> {
  __$$DDayImplCopyWithImpl(_$DDayImpl _value, $Res Function(_$DDayImpl) _then)
      : super(_value, _then);

  /// Create a copy of DDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goalTitle = null,
    Object? goalDate = null,
    Object? createDate = null,
    Object? color = null,
    Object? state = null,
  }) {
    return _then(_$DDayImpl(
      goalTitle: null == goalTitle
          ? _value.goalTitle
          : goalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      goalDate: null == goalDate
          ? _value.goalDate
          : goalDate // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DDayImpl implements _DDay {
  const _$DDayImpl(
      {@HiveField(0) required this.goalTitle,
      @HiveField(1) required this.goalDate,
      @HiveField(2) required this.createDate,
      @HiveField(3) required this.color,
      @HiveField(4) this.state = 0});

  factory _$DDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$DDayImplFromJson(json);

  @override
  @HiveField(0)
  final String goalTitle;
  @override
  @HiveField(1)
  final String goalDate;
  @override
  @HiveField(2)
  final String createDate;
  @override
  @HiveField(3)
  final String color;
  @override
  @JsonKey()
  @HiveField(4)
  final int state;

  @override
  String toString() {
    return 'DDay(goalTitle: $goalTitle, goalDate: $goalDate, createDate: $createDate, color: $color, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DDayImpl &&
            (identical(other.goalTitle, goalTitle) ||
                other.goalTitle == goalTitle) &&
            (identical(other.goalDate, goalDate) ||
                other.goalDate == goalDate) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, goalTitle, goalDate, createDate, color, state);

  /// Create a copy of DDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DDayImplCopyWith<_$DDayImpl> get copyWith =>
      __$$DDayImplCopyWithImpl<_$DDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DDayImplToJson(
      this,
    );
  }
}

abstract class _DDay implements DDay {
  const factory _DDay(
      {@HiveField(0) required final String goalTitle,
      @HiveField(1) required final String goalDate,
      @HiveField(2) required final String createDate,
      @HiveField(3) required final String color,
      @HiveField(4) final int state}) = _$DDayImpl;

  factory _DDay.fromJson(Map<String, dynamic> json) = _$DDayImpl.fromJson;

  @override
  @HiveField(0)
  String get goalTitle;
  @override
  @HiveField(1)
  String get goalDate;
  @override
  @HiveField(2)
  String get createDate;
  @override
  @HiveField(3)
  String get color;
  @override
  @HiveField(4)
  int get state;

  /// Create a copy of DDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DDayImplCopyWith<_$DDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
