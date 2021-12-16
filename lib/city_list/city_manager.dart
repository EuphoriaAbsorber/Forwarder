import 'dart:async';

import 'package:models/models.dart';

import '../state/city_list_state.dart';
import '../state/filter_state.dart';
import '../state/search_state.dart';
import '../utils/network_info.dart';
import 'services/city_api.dart';
import 'services/city_dao.dart';

class CityManager {
  final CityDao _cityDao;
  final CityApi _cityApi;

  final _networkInfo = NetworkInfo();

  final cityListState = CityListState(initState: []);
  final searchState = SearchState(initState: '');
  final filterState = FilterState(
    initState: Filter(
      price: 0,
      sea: 0,
      mountains: 0,
      culture: 0,
      architecture: 0,
      shopping: 0,
      entertainment: 0,
      nature: 0,
    ),
  );



  CityManager(this._cityDao, this._cityApi);

  Future<void> fetchCities() async =>
      cityListState.update(await getLatest());

  Future<void> addToFavorites(City item) async {
    await _cityDao.save(item);
    cityListState.setFlag(item, isFavorite: true);
  }

  Future<void> removeFromFavorites(City item) async {
    await _cityDao.delete(item);
    cityListState.setFlag(item, isFavorite: false);
  }

  Future<List<CityWithStatus>> getLatest() async {
    if (await _networkInfo.isConnected) {
      final items = await _cityApi.getLatest();
      final favorites = await _cityDao.getAll();
      final favoriteIds = favorites.map((c) => c.id).toSet();
      return items
          .map((c) =>
              CityWithStatus(city: c, isFavorite: favoriteIds.contains(c.id)))
          .toList();
    } else {
      final favorites = await _cityDao.getAll();
      return favorites
          .map((c) => CityWithStatus(city: c, isFavorite: true))
          .toList();
    }
  }
}
