import 'package:hive/hive.dart';

import '../base/city.dart';
import 'coords_hive_model.dart';
import 'filter_hive_model.dart';

part 'city_hive_model.g.dart';

@HiveType(typeId: 0)
class CityHiveModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String country;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String imgSrc;
  @HiveField(5)
  final CoordsHiveModel coords;
  @HiveField(6)
  final FilterHiveModel filter;
  @HiveField(7)
  final String airport;

  CityHiveModel({
    required this.id,
    required this.name,
    required this.imgSrc,
    required this.country,
    required this.coords,
    required this.description,
    required this.filter,
    required this.airport,
  });

  CityHiveModel.fromCity(City city)
      : id = city.id,
        name = city.name,
        imgSrc = city.imgSrc,
        country = city.country,
        coords = CoordsHiveModel.fromCoords(city.coords),
        description = city.description,
        filter = FilterHiveModel.fromFilter(city.filter),
        airport = city.airport;

  City toCity() => City(
        id: id,
        name: name,
        imgSrc: imgSrc,
        country: country,
        coords: coords.toCoords(),
        description: description,
        filter: filter.toFilter(),
        airport: airport,
      );
}
