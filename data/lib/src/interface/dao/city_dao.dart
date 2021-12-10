import 'package:data/src/model/city_item.dart';

abstract class CityDao {
  Future<void> save(CityItem cityItem);

  Future<List<CityItem>> getAll();

  Future<void> delete(CityItem item);
}
