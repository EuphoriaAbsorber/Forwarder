// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_list_network_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityListNetworkModel _$CityListNetworkModelFromJson(
        Map<String, dynamic> json) =>
    CityListNetworkModel(
      cityList: (json['cityList'] as List<dynamic>)
          .map((e) => CityNetworkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityListNetworkModelToJson(
        CityListNetworkModel instance) =>
    <String, dynamic>{
      'cityList': instance.cityList,
    };
