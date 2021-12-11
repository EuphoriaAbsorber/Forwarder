import 'package:data/data.dart';
import 'package:hive/hive.dart';
import 'city_hive_model.dart';

class CityDaoImpl extends CityDao {
  final Box<CityHiveModel> _box;

  CityDaoImpl(this._box);

  @override
  Future<List<CityItem>> getAll() async =>
      _box.values.map((item) => item.toCityItem()).toList();

  @override
  Future<void> save(CityItem item) async =>
      _box.put(item.id, CityHiveModel.fromFeed(item));

  @override
  Future<void> delete(CityItem item) => _box.delete(item.id);

}
