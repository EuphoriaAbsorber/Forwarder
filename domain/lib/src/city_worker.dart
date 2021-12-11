import 'package:data/data.dart';

class CityWorker {
  final CityDao _cityDao;
  final CityApi _cityApi;

  CityWorker(this._cityDao, this._cityApi);

  Future<void> addToFavorites(CityItem item) => _cityDao.save(item);

  void removeFromFavorites(CityItem item) => _cityDao.delete(item);

  Future<List<CityItem>> getFavorites() => _cityDao.getAll();

  Future<Map<CityItem, bool>> getLatest() async {
    final items = await _cityApi.getLatest();
    final favorites = await _cityDao.getAll();
    final favoriteIds = favorites.map((e) => e.id).toSet();
    return Map.fromEntries(
        items.map((e) => MapEntry(e, favoriteIds.contains(e.id))));
  }
}
