import 'package:json_annotation/json_annotation.dart';
import '../base/coords.dart';

part 'coords_network_model.g.dart';

@JsonSerializable()
class CoordsNetworkModel {
  @JsonKey(name: 'lat')
  final double lat;
  @JsonKey(name: 'lng')
  final double lng;

  const CoordsNetworkModel({
    required this.lat,
    required this.lng,
  });

  factory CoordsNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$CoordsNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordsNetworkModelToJson(this);

  Coords toCoords() => Coords(
    lat: lat,
    lng: lng,
  );
}
