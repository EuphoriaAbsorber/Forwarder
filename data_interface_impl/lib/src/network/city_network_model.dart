import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_network_model.g.dart';

@JsonSerializable()
class CityNetworkModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "imgSrc")
  final String imgSrc;

  CityNetworkModel({required this.id, required this.name, required this.imgSrc});

  factory CityNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$CityNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityNetworkModelToJson(this);

  CityItem toFeedItem() => CityItem(id: id, name: name, imgSrc: imgSrc);
}
