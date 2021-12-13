import 'package:hive/hive.dart';

import '../base/city.dart';
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
  final String coords;
  @HiveField(6)
  final FilterHiveModel filter;

  CityHiveModel({
    required this.id,
    required this.name,
    required this.imgSrc,
    required this.country,
    required this.coords,
    required this.description,
    required this.filter,
  });

  CityHiveModel.fromCity(City city)
      : id = city.id,
        name = city.name,
        imgSrc = city.imgSrc,
        country = city.country,
        coords = city.coords,
        description = city.description,
        filter = FilterHiveModel.fromFilter(city.filter);


  City toCityItem() => City(
        id: id,
        name: name,
        imgSrc: imgSrc,
        country: country,
        coords: coords,
        description: description,
        filter: filter.toFilter(),
      );
}
