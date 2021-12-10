// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return _WeatherModel.fromJson(json);
}

/// @nodoc
class _$WeatherModelTearOff {
  const _$WeatherModelTearOff();

  _WeatherModel call(
      {@JsonKey(name: 'data') List<MonthTemperatureModel>? months}) {
    return _WeatherModel(
      months: months,
    );
  }

  WeatherModel fromJson(Map<String, Object?> json) {
    return WeatherModel.fromJson(json);
  }
}

/// @nodoc
const $WeatherModel = _$WeatherModelTearOff();

/// @nodoc
mixin _$WeatherModel {
  @JsonKey(name: 'data')
  List<MonthTemperatureModel>? get months => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherModelCopyWith<WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelCopyWith<$Res> {
  factory $WeatherModelCopyWith(
          WeatherModel value, $Res Function(WeatherModel) then) =
      _$WeatherModelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'data') List<MonthTemperatureModel>? months});
}

/// @nodoc
class _$WeatherModelCopyWithImpl<$Res> implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._value, this._then);

  final WeatherModel _value;
  // ignore: unused_field
  final $Res Function(WeatherModel) _then;

  @override
  $Res call({
    Object? months = freezed,
  }) {
    return _then(_value.copyWith(
      months: months == freezed
          ? _value.months
          : months // ignore: cast_nullable_to_non_nullable
              as List<MonthTemperatureModel>?,
    ));
  }
}

/// @nodoc
abstract class _$WeatherModelCopyWith<$Res>
    implements $WeatherModelCopyWith<$Res> {
  factory _$WeatherModelCopyWith(
          _WeatherModel value, $Res Function(_WeatherModel) then) =
      __$WeatherModelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'data') List<MonthTemperatureModel>? months});
}

/// @nodoc
class __$WeatherModelCopyWithImpl<$Res> extends _$WeatherModelCopyWithImpl<$Res>
    implements _$WeatherModelCopyWith<$Res> {
  __$WeatherModelCopyWithImpl(
      _WeatherModel _value, $Res Function(_WeatherModel) _then)
      : super(_value, (v) => _then(v as _WeatherModel));

  @override
  _WeatherModel get _value => super._value as _WeatherModel;

  @override
  $Res call({
    Object? months = freezed,
  }) {
    return _then(_WeatherModel(
      months: months == freezed
          ? _value.months
          : months // ignore: cast_nullable_to_non_nullable
              as List<MonthTemperatureModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherModel implements _WeatherModel {
  _$_WeatherModel({@JsonKey(name: 'data') this.months});

  factory _$_WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherModelFromJson(json);

  @override
  @JsonKey(name: 'data')
  final List<MonthTemperatureModel>? months;

  @override
  String toString() {
    return 'WeatherModel(months: $months)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherModel &&
            const DeepCollectionEquality().equals(other.months, months));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(months));

  @JsonKey(ignore: true)
  @override
  _$WeatherModelCopyWith<_WeatherModel> get copyWith =>
      __$WeatherModelCopyWithImpl<_WeatherModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherModelToJson(this);
  }
}

abstract class _WeatherModel implements WeatherModel {
  factory _WeatherModel(
          {@JsonKey(name: 'data') List<MonthTemperatureModel>? months}) =
      _$_WeatherModel;

  factory _WeatherModel.fromJson(Map<String, dynamic> json) =
      _$_WeatherModel.fromJson;

  @override
  @JsonKey(name: 'data')
  List<MonthTemperatureModel>? get months;
  @override
  @JsonKey(ignore: true)
  _$WeatherModelCopyWith<_WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}
