import 'package:data/src/model/city_item.dart';

abstract class CityApi {
  Future<List<CityItem>> getLatest();
}
