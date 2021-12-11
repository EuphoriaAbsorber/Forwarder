import 'package:json_annotation/json_annotation.dart';

import '../../models.dart';

part 'city_list_network_model.g.dart';

@JsonSerializable()
class CityListNetworkModel {
  @JsonKey(name: 'data')
  final List<CityNetworkModel> cityList;

  const CityListNetworkModel({required this.cityList});

  factory CityListNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$CityListNetworkModelFromJson(json);
}