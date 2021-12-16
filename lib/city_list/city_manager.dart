import 'dart:async';

import 'package:models/models.dart';

import '../utils/network_info.dart';
import 'services/city_api.dart';
import 'services/city_dao.dart';
import 'state_controller.dart';

class CityManager {
  final CityDao _cityDao;
  final CityApi _cityApi;

  final _networkInfo = NetworkInfo();

  final stateController = StateController();

  CityManager(this._cityDao, this._cityApi);

  Future<void> fetchCities() async => stateController.updateCityList(await getLatest());

  Future<void> addToFavorites(City item) async {
    await _cityDao.save(item);
    stateController.setCityFlag(item, isFavorite: true);
  }

  Future<void> removeFromFavorites(City item) async {
    await _cityDao.delete(item);
    stateController.setCityFlag(item, isFavorite: false);
  }

  Future<List<Pair<City, bool>>> getLatest() async {
    if (await _networkInfo.isConnected) {
      try {
        final items = await _cityApi.getLatest();
        final favorites = await _cityDao.getAll();
        final favoriteIds = favorites.map((e) => e.id).toSet();
        return items.map((e) =>
            Pair(first: e, second: favoriteIds.contains(e.id))).toList();
      } catch (e) {
        final favorites = await _cityDao.getAll();

        return favorites.map((e) => Pair(first: e, second: true)).toList();
      }
    } else {
      final favorites = await _cityDao.getAll();
      return favorites.map((e) => Pair(first: e, second: true)).toList();
    }
  }
}