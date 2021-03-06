// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'covid_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CovidModel _$CovidModelFromJson(Map<String, dynamic> json) {
  return _CovidModel.fromJson(json);
}

/// @nodoc
class _$CovidModelTearOff {
  const _$CovidModelTearOff();

  _CovidModel call(
      {@JsonKey(name: 'Cases') int? confirmed,
      @JsonKey(name: 'Date') String? date}) {
    return _CovidModel(
      confirmed: confirmed,
      date: date,
    );
  }

  CovidModel fromJson(Map<String, Object?> json) {
    return CovidModel.fromJson(json);
  }
}

/// @nodoc
const $CovidModel = _$CovidModelTearOff();

/// @nodoc
mixin _$CovidModel {
  @JsonKey(name: 'Cases')
  int? get confirmed => throw _privateConstructorUsedError;
  @JsonKey(name: 'Date')
  String? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CovidModelCopyWith<CovidModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CovidModelCopyWith<$Res> {
  factory $CovidModelCopyWith(
          CovidModel value, $Res Function(CovidModel) then) =
      _$CovidModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Cases') int? confirmed,
      @JsonKey(name: 'Date') String? date});
}

/// @nodoc
class _$CovidModelCopyWithImpl<$Res> implements $CovidModelCopyWith<$Res> {
  _$CovidModelCopyWithImpl(this._value, this._then);

  final CovidModel _value;
  // ignore: unused_field
  final $Res Function(CovidModel) _then;

  @override
  $Res call({
    Object? confirmed = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      confirmed: confirmed == freezed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as int?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CovidModelCopyWith<$Res> implements $CovidModelCopyWith<$Res> {
  factory _$CovidModelCopyWith(
          _CovidModel value, $Res Function(_CovidModel) then) =
      __$CovidModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Cases') int? confirmed,
      @JsonKey(name: 'Date') String? date});
}

/// @nodoc
class __$CovidModelCopyWithImpl<$Res> extends _$CovidModelCopyWithImpl<$Res>
    implements _$CovidModelCopyWith<$Res> {
  __$CovidModelCopyWithImpl(
      _CovidModel _value, $Res Function(_CovidModel) _then)
      : super(_value, (v) => _then(v as _CovidModel));

  @override
  _CovidModel get _value => super._value as _CovidModel;

  @override
  $Res call({
    Object? confirmed = freezed,
    Object? date = freezed,
  }) {
    return _then(_CovidModel(
      confirmed: confirmed == freezed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as int?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CovidModel implements _CovidModel {
  _$_CovidModel(
      {@JsonKey(name: 'Cases') this.confirmed,
      @JsonKey(name: 'Date') this.date});

  factory _$_CovidModel.fromJson(Map<String, dynamic> json) =>
      _$$_CovidModelFromJson(json);

  @override
  @JsonKey(name: 'Cases')
  final int? confirmed;
  @override
  @JsonKey(name: 'Date')
  final String? date;

  @override
  String toString() {
    return 'CovidModel(confirmed: $confirmed, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CovidModel &&
            const DeepCollectionEquality().equals(other.confirmed, confirmed) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(confirmed),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$CovidModelCopyWith<_CovidModel> get copyWith =>
      __$CovidModelCopyWithImpl<_CovidModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CovidModelToJson(this);
  }
}

abstract class _CovidModel implements CovidModel {
  factory _CovidModel(
      {@JsonKey(name: 'Cases') int? confirmed,
      @JsonKey(name: 'Date') String? date}) = _$_CovidModel;

  factory _CovidModel.fromJson(Map<String, dynamic> json) =
      _$_CovidModel.fromJson;

  @override
  @JsonKey(name: 'Cases')
  int? get confirmed;
  @override
  @JsonKey(name: 'Date')
  String? get date;
  @override
  @JsonKey(ignore: true)
  _$CovidModelCopyWith<_CovidModel> get copyWith =>
      throw _privateConstructorUsedError;
}
