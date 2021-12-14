// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coords.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CoordsTearOff {
  const _$CoordsTearOff();

  _Coords call({required double lat, required double lng}) {
    return _Coords(
      lat: lat,
      lng: lng,
    );
  }
}

/// @nodoc
const $Coords = _$CoordsTearOff();

/// @nodoc
mixin _$Coords {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoordsCopyWith<Coords> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordsCopyWith<$Res> {
  factory $CoordsCopyWith(Coords value, $Res Function(Coords) then) =
      _$CoordsCopyWithImpl<$Res>;
  $Res call({double lat, double lng});
}

/// @nodoc
class _$CoordsCopyWithImpl<$Res> implements $CoordsCopyWith<$Res> {
  _$CoordsCopyWithImpl(this._value, this._then);

  final Coords _value;
  // ignore: unused_field
  final $Res Function(Coords) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$CoordsCopyWith<$Res> implements $CoordsCopyWith<$Res> {
  factory _$CoordsCopyWith(_Coords value, $Res Function(_Coords) then) =
      __$CoordsCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lng});
}

/// @nodoc
class __$CoordsCopyWithImpl<$Res> extends _$CoordsCopyWithImpl<$Res>
    implements _$CoordsCopyWith<$Res> {
  __$CoordsCopyWithImpl(_Coords _value, $Res Function(_Coords) _then)
      : super(_value, (v) => _then(v as _Coords));

  @override
  _Coords get _value => super._value as _Coords;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_Coords(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Coords implements _Coords {
  _$_Coords({required this.lat, required this.lng});

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'Coords(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Coords &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng));

  @JsonKey(ignore: true)
  @override
  _$CoordsCopyWith<_Coords> get copyWith =>
      __$CoordsCopyWithImpl<_Coords>(this, _$identity);
}

abstract class _Coords implements Coords {
  factory _Coords({required double lat, required double lng}) = _$_Coords;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$CoordsCopyWith<_Coords> get copyWith => throw _privateConstructorUsedError;
}
