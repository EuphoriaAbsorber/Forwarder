import 'package:models/models.dart';
import 'services/city_api.dart';
import 'services/city_dao.dart';

class CityManager {
  final CityDao _cityDao;
  final CityApi _cityApi;

  CityManager(this._cityDao, this._cityApi);

  Future<void> addToFavorites(CityItem item) => _cityDao.save(item);

  void removeFromFavorites(CityItem item) => _cityDao.delete(item);

  Future<List<CityItem>> getFavorites() => _cityDao.getAll();

  Future<Map<CityItem, bool>> getLatest() async {
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
