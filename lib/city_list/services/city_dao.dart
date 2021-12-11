import 'package:hive/hive.dart';
import 'package:models/models.dart';


class CityDao {
  final Box<CityHiveModel> _box;

  CityDao(this._box);

  Future<List<CityItem>> getAll() async =>
      _box.values.map((item) => item.toCityItem()).toList();

  Future<void> save(CityItem item) async =>
      _box.put(item.id, CityHiveModel.fromFeed(item));

  Future<void> delete(CityItem item) => _box.delete(item.id);

}
