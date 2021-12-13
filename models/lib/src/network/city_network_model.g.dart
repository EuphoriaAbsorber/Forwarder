// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_network_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityNetworkModel _$CityNetworkModelFromJson(Map<String, dynamic> json) =>
    CityNetworkModel(
      id: json['id'] as int,
      name: json['title'] as String,
      imgSrc: json['image_url'] as String,
      country: json['country'] as String,
      coords: json['coords'] as String,
      description: json['description'] as String,
      filter:
          FilterNetworkModel.fromJson(json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityNetworkModelToJson(CityNetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.name,
      'image_url': instance.imgSrc,
      'country': instance.country,
      'coords': instance.coords,
      'description': instance.description,
      'filters': instance.filter,
    };
