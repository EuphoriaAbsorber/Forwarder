import 'dart:async';

import 'package:models/models.dart';

import '../utils/network_info.dart';
import 'services/city_api.dart';
import 'services/city_dao.dart';

class Pair<T,R> {
  final T first;
  final R second;
  const Pair({required this.first, required this.second});
}

class CityManager extends BaseManager<List<Pair<City, bool>>> {
  final CityDao _cityDao;
  final CityApi _cityApi;

  List<Pair<City, bool>> currentCityData = [];

  final _networkInfo = NetworkInfo();

  CityManager(this._cityDao, this._cityApi);

  Future<void> fetchCities() async {
    currentCityData = await getLatest();
    super.addData(currentCityData);
  }

  Future<void> addToFavorites(City item) async {
    await _cityDao.save(item);
    for(var i = 0; i<currentCityData.length; ++i) {
      if(currentCityData[i].first.id == item.id) {
        currentCityData[i] = Pair(first: item, second: true);
        break;
      }
    }
    super.addData(currentCityData);
  }

  Future<void> removeFromFavorites(City item) async {
    await _cityDao.delete(item);
    for(var i = 0; i<currentCityData.length; ++i) {
      if(currentCityData[i].first.id == item.id) {
        currentCityData[i] = Pair(first: item, second: false);
        break;
      }
    }
    super.addData(currentCityData);
  }

  Future<List<Pair<City, bool>>> getLatest() async {
    if (await _networkInfo.isConnected) {
      final items = await _cityApi.getLatest();
      final favorites = await _cityDao.getAll();
      final favoriteIds = favorites.map((e) => e.id).toSet();
      return items.map((e) => Pair(first: e, second: favoriteIds.contains(e.id))).toList();
    } else {
      final favorites = await _cityDao.getAll();
      return favorites.map((e) => Pair(first: e, second: true)).toList();
    }
  }
}

abstract class BaseManager<T> {
  final _streamController = StreamController<T>.broadcast();

  void addData(T data) {
    _streamController.add(data);
  }

  Stream<T> get stream => _streamController.stream;
}