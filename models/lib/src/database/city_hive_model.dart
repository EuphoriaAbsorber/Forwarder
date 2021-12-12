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
  final String imgSrc;
  @HiveField(3)
  final FilterHiveModel filter;

  CityHiveModel({
    required this.id,
    required this.name,
    required this.imgSrc,
    required this.filter,
  });

  CityHiveModel.fromCity(City city)
      : id = city.id,
        name = city.name,
        imgSrc = city.imgSrc,
        filter = FilterHiveModel.fromFilter(city.filter);

  City toCityItem() => City(id: id, name: name, imgSrc: imgSrc, filter: filter.toFilter());
}
