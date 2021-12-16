// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CityTearOff {
  const _$CityTearOff();

  _City call(
      {required int id,
      required String name,
      required String imgSrc,
      required String country,
      required String airport,
      required Coords coords,
      required String description,
      required Filter filter}) {
    return _City(
      id: id,
      name: name,
      imgSrc: imgSrc,
      country: country,
      airport: airport,
      coords: coords,
      description: description,
      filter: filter,
    );
  }
}

/// @nodoc
const $City = _$CityTearOff();

/// @nodoc
mixin _$City {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imgSrc => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get airport => throw _privateConstructorUsedError;
  Coords get coords => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Filter get filter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CityCopyWith<City> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) then) =
      _$CityCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String imgSrc,
      String country,
      String airport,
      Coords coords,
      String description,
      Filter filter});

  $CoordsCopyWith<$Res> get coords;
  $FilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$CityCopyWithImpl<$Res> implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._value, this._then);

  final City _value;
  // ignore: unused_field
  final $Res Function(City) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imgSrc = freezed,
    Object? country = freezed,
    Object? airport = freezed,
    Object? coords = freezed,
    Object? description = freezed,
    Object? filter = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imgSrc: imgSrc == freezed
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      airport: airport == freezed
          ? _value.airport
          : airport // ignore: cast_nullable_to_non_nullable
              as String,
      coords: coords == freezed
          ? _value.coords
          : coords // ignore: cast_nullable_to_non_nullable
              as Coords,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
    ));
  }

  @override
  $CoordsCopyWith<$Res> get coords {
    return $CoordsCopyWith<$Res>(_value.coords, (value) {
      return _then(_value.copyWith(coords: value));
    });
  }

  @override
  $FilterCopyWith<$Res> get filter {
    return $FilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value));
    });
  }
}

/// @nodoc
abstract class _$CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$CityCopyWith(_City value, $Res Function(_City) then) =
      __$CityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String imgSrc,
      String country,
      String airport,
      Coords coords,
      String description,
      Filter filter});

  @override
  $CoordsCopyWith<$Res> get coords;
  @override
  $FilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$CityCopyWithImpl<$Res> extends _$CityCopyWithImpl<$Res>
    implements _$CityCopyWith<$Res> {
  __$CityCopyWithImpl(_City _value, $Res Function(_City) _then)
      : super(_value, (v) => _then(v as _City));

  @override
  _City get _value => super._value as _City;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imgSrc = freezed,
    Object? country = freezed,
    Object? airport = freezed,
    Object? coords = freezed,
    Object? description = freezed,
    Object? filter = freezed,
  }) {
    return _then(_City(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imgSrc: imgSrc == freezed
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      airport: airport == freezed
          ? _value.airport
          : airport // ignore: cast_nullable_to_non_nullable
              as String,
      coords: coords == freezed
          ? _value.coords
          : coords // ignore: cast_nullable_to_non_nullable
              as Coords,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
    ));
  }
}

/// @nodoc

class _$_City implements _City {
  _$_City(
      {required this.id,
      required this.name,
      required this.imgSrc,
      required this.country,
      required this.airport,
      required this.coords,
      required this.description,
      required this.filter});

  @override
  final int id;
  @override
  final String name;
  @override
  final String imgSrc;
  @override
  final String country;
  @override
  final String airport;
  @override
  final Coords coords;
  @override
  final String description;
  @override
  final Filter filter;

  @override
  String toString() {
    return 'City(id: $id, name: $name, imgSrc: $imgSrc, country: $country, airport: $airport, coords: $coords, description: $description, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _City &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imgSrc, imgSrc) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.airport, airport) &&
            const DeepCollectionEquality().equals(other.coords, coords) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.filter, filter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imgSrc),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(airport),
      const DeepCollectionEquality().hash(coords),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(filter));

  @JsonKey(ignore: true)
  @override
  _$CityCopyWith<_City> get copyWith =>
      __$CityCopyWithImpl<_City>(this, _$identity);
}

abstract class _City implements City {
  factory _City(
      {required int id,
      required String name,
      required String imgSrc,
      required String country,
      required String airport,
      required Coords coords,
      required String description,
      required Filter filter}) = _$_City;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imgSrc;
  @override
  String get country;
  @override
  String get airport;
  @override
  Coords get coords;
  @override
  String get description;
  @override
  Filter get filter;
  @override
  @JsonKey(ignore: true)
  _$CityCopyWith<_City> get copyWith => throw _privateConstructorUsedError;
}
