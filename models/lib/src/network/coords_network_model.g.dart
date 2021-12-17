// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coords_network_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordsNetworkModel _$CoordsNetworkModelFromJson(Map<String, dynamic> json) =>
    CoordsNetworkModel(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordsNetworkModelToJson(CoordsNetworkModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
