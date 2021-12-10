// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'month_temperature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MonthTemperatureModel _$MonthTemperatureModelFromJson(
    Map<String, dynamic> json) {
  return _MonthTemperatureModel.fromJson(json);
}

/// @nodoc
class _$MonthTemperatureModelTearOff {
  const _$MonthTemperatureModelTearOff();

  _MonthTemperatureModel call({@JsonKey(name: 'tavg') double? tavg}) {
    return _MonthTemperatureModel(
      tavg: tavg,
    );
  }

  MonthTemperatureModel fromJson(Map<String, Object?> json) {
    return MonthTemperatureModel.fromJson(json);
  }
}

/// @nodoc
const $MonthTemperatureModel = _$MonthTemperatureModelTearOff();

/// @nodoc
mixin _$MonthTemperatureModel {
  @JsonKey(name: 'tavg')
  double? get tavg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthTemperatureModelCopyWith<MonthTemperatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthTemperatureModelCopyWith<$Res> {
  factory $MonthTemperatureModelCopyWith(MonthTemperatureModel value,
          $Res Function(MonthTemperatureModel) then) =
      _$MonthTemperatureModelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'tavg') double? tavg});
}

/// @nodoc
class _$MonthTemperatureModelCopyWithImpl<$Res>
    implements $MonthTemperatureModelCopyWith<$Res> {
  _$MonthTemperatureModelCopyWithImpl(this._value, this._then);

  final MonthTemperatureModel _value;
  // ignore: unused_field
  final $Res Function(MonthTemperatureModel) _then;

  @override
  $Res call({
    Object? tavg = freezed,
  }) {
    return _then(_value.copyWith(
      tavg: tavg == freezed
          ? _value.tavg
          : tavg // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$MonthTemperatureModelCopyWith<$Res>
    implements $MonthTemperatureModelCopyWith<$Res> {
  factory _$MonthTemperatureModelCopyWith(_MonthTemperatureModel value,
          $Res Function(_MonthTemperatureModel) then) =
      __$MonthTemperatureModelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'tavg') double? tavg});
}

/// @nodoc
class __$MonthTemperatureModelCopyWithImpl<$Res>
    extends _$MonthTemperatureModelCopyWithImpl<$Res>
    implements _$MonthTemperatureModelCopyWith<$Res> {
  __$MonthTemperatureModelCopyWithImpl(_MonthTemperatureModel _value,
      $Res Function(_MonthTemperatureModel) _then)
      : super(_value, (v) => _then(v as _MonthTemperatureModel));

  @override
  _MonthTemperatureModel get _value => super._value as _MonthTemperatureModel;

  @override
  $Res call({
    Object? tavg = freezed,
  }) {
    return _then(_MonthTemperatureModel(
      tavg: tavg == freezed
          ? _value.tavg
          : tavg // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MonthTemperatureModel implements _MonthTemperatureModel {
  _$_MonthTemperatureModel({@JsonKey(name: 'tavg') this.tavg});

  factory _$_MonthTemperatureModel.fromJson(Map<String, dynamic> json) =>
      _$$_MonthTemperatureModelFromJson(json);

  @override
  @JsonKey(name: 'tavg')
  final double? tavg;

  @override
  String toString() {
    return 'MonthTemperatureModel(tavg: $tavg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MonthTemperatureModel &&
            const DeepCollectionEquality().equals(other.tavg, tavg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tavg));

  @JsonKey(ignore: true)
  @override
  _$MonthTemperatureModelCopyWith<_MonthTemperatureModel> get copyWith =>
      __$MonthTemperatureModelCopyWithImpl<_MonthTemperatureModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MonthTemperatureModelToJson(this);
  }
}

abstract class _MonthTemperatureModel implements MonthTemperatureModel {
  factory _MonthTemperatureModel({@JsonKey(name: 'tavg') double? tavg}) =
      _$_MonthTemperatureModel;

  factory _MonthTemperatureModel.fromJson(Map<String, dynamic> json) =
      _$_MonthTemperatureModel.fromJson;

  @override
  @JsonKey(name: 'tavg')
  double? get tavg;
  @override
  @JsonKey(ignore: true)
  _$MonthTemperatureModelCopyWith<_MonthTemperatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}
