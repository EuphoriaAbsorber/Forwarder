import 'package:json_annotation/json_annotation.dart';

import '../base/city.dart';
import 'filter_network_model.dart';

part 'city_network_model.g.dart';

@JsonSerializable()
class CityNetworkModel {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String name;
  @JsonKey(name: 'image_url')
  final String imgSrc;
  @JsonKey(name: 'filters')
  final FilterNetworkModel filter;


  const CityNetworkModel({
    required this.id,
    required this.name,
    required this.imgSrc,
    required this.filter,
  });

  factory CityNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$CityNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityNetworkModelToJson(this);

  City toCityItem() => City(
        id: id,
        name: name,
        imgSrc: imgSrc,
        filter: filter.toFilter(),
      );
}
