import 'package:hive/hive.dart';
import 'package:models/models.dart';


class CityDao {
  final Box<CityHiveModel> _box;

  CityDao(this._box);

  Future<List<City>> getAll() async =>
      _box.values.map((item) => item.toCity()).toList();

  Future<void> save(City item) async =>
      _box.put(item.id, CityHiveModel.fromCity(item));

  Future<void> delete(City item) => _box.delete(item.id);

}
