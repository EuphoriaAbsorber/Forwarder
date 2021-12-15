import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../utils/network_info.dart';
import 'services/city_api.dart';
import 'services/city_dao.dart';

class CityManager extends ChangeNotifier {
  final CityDao _cityDao;
  final CityApi _cityApi;

  final _networkInfo = NetworkInfo();

  CityManager(this._cityDao, this._cityApi);

  Future<void> addToFavorites(City item) => _cityDao.save(item);

  Future<void> removeFromFavorites(City item) => _cityDao.delete(item);

  Future<Map<City, bool>> getLatest() async {
    if (await _networkInfo.isConnected) {
      final items = await _cityApi.getLatest();
      final favorites = await _cityDao.getAll();
      final favoriteIds = favorites.map((e) => e.id).toSet();
      return Map.fromEntries(
          items.map((e) => MapEntry(e, favoriteIds.contains(e.id))));
    } else {
      final favorites = await _cityDao.getAll();
      return Map.fromEntries(favorites.map((e) => MapEntry(e, true)));
    }
  }
}
