// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) {
  return _TicketModel.fromJson(json);
}

/// @nodoc
class _$TicketModelTearOff {
  const _$TicketModelTearOff();

  _TicketModel call({@JsonKey(name: 'value') int? price}) {
    return _TicketModel(
      price: price,
    );
  }

  TicketModel fromJson(Map<String, Object?> json) {
    return TicketModel.fromJson(json);
  }
}

/// @nodoc
const $TicketModel = _$TicketModelTearOff();

/// @nodoc
mixin _$TicketModel {
  @JsonKey(name: 'value')
  int? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketModelCopyWith<TicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketModelCopyWith<$Res> {
  factory $TicketModelCopyWith(
          TicketModel value, $Res Function(TicketModel) then) =
      _$TicketModelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'value') int? price});
}

/// @nodoc
class _$TicketModelCopyWithImpl<$Res> implements $TicketModelCopyWith<$Res> {
  _$TicketModelCopyWithImpl(this._value, this._then);

  final TicketModel _value;
  // ignore: unused_field
  final $Res Function(TicketModel) _then;

  @override
  $Res call({
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$TicketModelCopyWith<$Res>
    implements $TicketModelCopyWith<$Res> {
  factory _$TicketModelCopyWith(
          _TicketModel value, $Res Function(_TicketModel) then) =
      __$TicketModelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'value') int? price});
}

/// @nodoc
class __$TicketModelCopyWithImpl<$Res> extends _$TicketModelCopyWithImpl<$Res>
    implements _$TicketModelCopyWith<$Res> {
  __$TicketModelCopyWithImpl(
      _TicketModel _value, $Res Function(_TicketModel) _then)
      : super(_value, (v) => _then(v as _TicketModel));

  @override
  _TicketModel get _value => super._value as _TicketModel;

  @override
  $Res call({
    Object? price = freezed,
  }) {
    return _then(_TicketModel(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TicketModel implements _TicketModel {
  _$_TicketModel({@JsonKey(name: 'value') this.price});

  factory _$_TicketModel.fromJson(Map<String, dynamic> json) =>
      _$$_TicketModelFromJson(json);

  @override
  @JsonKey(name: 'value')
  final int? price;

  @override
  String toString() {
    return 'TicketModel(price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TicketModel &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$TicketModelCopyWith<_TicketModel> get copyWith =>
      __$TicketModelCopyWithImpl<_TicketModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketModelToJson(this);
  }
}

abstract class _TicketModel implements TicketModel {
  factory _TicketModel({@JsonKey(name: 'value') int? price}) = _$_TicketModel;

  factory _TicketModel.fromJson(Map<String, dynamic> json) =
      _$_TicketModel.fromJson;

  @override
  @JsonKey(name: 'value')
  int? get price;
  @override
  @JsonKey(ignore: true)
  _$TicketModelCopyWith<_TicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}
