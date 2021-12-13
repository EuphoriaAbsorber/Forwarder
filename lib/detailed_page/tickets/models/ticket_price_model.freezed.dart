// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticket_price_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketPriceModel _$TicketPriceModelFromJson(Map<String, dynamic> json) {
  return _TicketPriceModel.fromJson(json);
}

/// @nodoc
class _$TicketPriceModelTearOff {
  const _$TicketPriceModelTearOff();

  _TicketPriceModel call({@JsonKey(name: 'data') List<TicketModel>? data}) {
    return _TicketPriceModel(
      data: data,
    );
  }

  TicketPriceModel fromJson(Map<String, Object?> json) {
    return TicketPriceModel.fromJson(json);
  }
}

/// @nodoc
const $TicketPriceModel = _$TicketPriceModelTearOff();

/// @nodoc
mixin _$TicketPriceModel {
  @JsonKey(name: 'data')
  List<TicketModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketPriceModelCopyWith<TicketPriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketPriceModelCopyWith<$Res> {
  factory $TicketPriceModelCopyWith(
          TicketPriceModel value, $Res Function(TicketPriceModel) then) =
      _$TicketPriceModelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'data') List<TicketModel>? data});
}

/// @nodoc
class _$TicketPriceModelCopyWithImpl<$Res>
    implements $TicketPriceModelCopyWith<$Res> {
  _$TicketPriceModelCopyWithImpl(this._value, this._then);

  final TicketPriceModel _value;
  // ignore: unused_field
  final $Res Function(TicketPriceModel) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TicketModel>?,
    ));
  }
}

/// @nodoc
abstract class _$TicketPriceModelCopyWith<$Res>
    implements $TicketPriceModelCopyWith<$Res> {
  factory _$TicketPriceModelCopyWith(
          _TicketPriceModel value, $Res Function(_TicketPriceModel) then) =
      __$TicketPriceModelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'data') List<TicketModel>? data});
}

/// @nodoc
class __$TicketPriceModelCopyWithImpl<$Res>
    extends _$TicketPriceModelCopyWithImpl<$Res>
    implements _$TicketPriceModelCopyWith<$Res> {
  __$TicketPriceModelCopyWithImpl(
      _TicketPriceModel _value, $Res Function(_TicketPriceModel) _then)
      : super(_value, (v) => _then(v as _TicketPriceModel));

  @override
  _TicketPriceModel get _value => super._value as _TicketPriceModel;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_TicketPriceModel(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TicketModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TicketPriceModel implements _TicketPriceModel {
  _$_TicketPriceModel({@JsonKey(name: 'data') this.data});

  factory _$_TicketPriceModel.fromJson(Map<String, dynamic> json) =>
      _$$_TicketPriceModelFromJson(json);

  @override
  @JsonKey(name: 'data')
  final List<TicketModel>? data;

  @override
  String toString() {
    return 'TicketPriceModel(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TicketPriceModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$TicketPriceModelCopyWith<_TicketPriceModel> get copyWith =>
      __$TicketPriceModelCopyWithImpl<_TicketPriceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketPriceModelToJson(this);
  }
}

abstract class _TicketPriceModel implements TicketPriceModel {
  factory _TicketPriceModel({@JsonKey(name: 'data') List<TicketModel>? data}) =
      _$_TicketPriceModel;

  factory _TicketPriceModel.fromJson(Map<String, dynamic> json) =
      _$_TicketPriceModel.fromJson;

  @override
  @JsonKey(name: 'data')
  List<TicketModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$TicketPriceModelCopyWith<_TicketPriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
