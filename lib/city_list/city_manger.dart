import 'package:models/models.dart';
import 'services/city_api.dart';
import 'services/city_dao.dart';

class CityManager {
  final CityDao _cityDao;
  final CityApi _cityApi;

  CityManager(this._cityDao, this._cityApi);

  Future<void> addToFavorites(City item) => _cityDao.save(item);

  void removeFromFavorites(City item) => _cityDao.delete(item);

  Future<List<City>> getFavorites() => _cityDao.getAll();

  Future<Map<City, bool>> getLatest() async {
    final favorites = await _cityDao.getAll();
    try {
      final items = await _cityApi.getLatest();
      final favoriteIds = favorites.map((e) => e.id).toSet();
       return Map.fromEntries(
          items.map((e) => MapEntry(e, favoriteIds.contains(e.id))));
    } catch(e) {
      return Map.fromEntries(favorites.map((e) => MapEntry(e, true)));
    }
  }
}
