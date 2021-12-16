// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_network_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterNetworkModel _$FilterNetworkModelFromJson(Map<String, dynamic> json) =>
    FilterNetworkModel(
      price: json['price'] as int,
      sea: json['sea'] as int,
      mountains: json['mountains'] as int,
      culture: json['culture'] as int,
      architecture: json['architecture'] as int,
      shopping: json['shopping'] as int,
      entertainment: json['entertainment'] as int,
      nature: json['nature'] as int,
    );

Map<String, dynamic> _$FilterNetworkModelToJson(FilterNetworkModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'sea': instance.sea,
      'mountains': instance.mountains,
      'culture': instance.culture,
      'architecture': instance.architecture,
      'shopping': instance.shopping,
      'entertainment': instance.entertainment,
      'nature': instance.nature,
    };
