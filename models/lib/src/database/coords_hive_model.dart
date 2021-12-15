import 'package:hive/hive.dart';
import '../base/coords.dart';

part 'coords_hive_model.g.dart';

@HiveType(typeId: 2)
class CoordsHiveModel extends HiveObject {
  @HiveField(0)
  final double lat;
  @HiveField(1)
  final double lng;

  CoordsHiveModel({
    required this.lat,
    required this.lng,
  });

  CoordsHiveModel.fromCoords(Coords coords)
      : lat = coords.lat,
        lng = coords.lng;

  Coords toCoords() => Coords(
    lat: lat,
    lng: lng,
  );
}
