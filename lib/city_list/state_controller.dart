import 'dart:async';

import 'package:models/models.dart';

class StateController {
  List<Pair<City, bool>> _currentCityData = [];

  final _cityListStreamController = StreamController<List<Pair<City, bool>>>.broadcast();

  void updateCityList(List<Pair<City, bool>> data) {
    _currentCityData = data;
    _cityListStreamController.add(_currentCityData);
  }

  void setCityFlag(City city, {required bool isFavorite}) {
    for(var i = 0; i<_currentCityData.length; ++i) {
      if(_currentCityData[i].first.id == city.id) {
        _currentCityData[i] = Pair(first: city, second: isFavorite);
        break;
      }
    }
    updateCityList(_currentCityData);
  }

  Stream<List<Pair<City, bool>>> get cityListStream => _cityListStreamController.stream;

  Filter currentFilter = Filter(
      price: 0,
      sea: 0,
      mountains: 0,
      culture: 0,
      architecture: 0,
      shopping: 0,
      entertainment: 0,
      nature: 0);

  final _filterStreamController = StreamController<Filter>.broadcast();
  void updateFilter(Filter data) {
    currentFilter = data;
    _filterStreamController.add(currentFilter);
  }


  // Stream<Filter> get filterStream => _filterStreamController.stream;

  // Stream<Filter> get filterStream => getStream;

  Stream<Filter> get getStream async* {
    yield currentFilter;
    yield* _filterStreamController.stream;
  }

  String _search = '';

  final _searchStreamController = StreamController<String>.broadcast();
  void updateSearch(String data) {
    _search = data;
    _searchStreamController.add(_search);
  }
  Stream<String> get searchStream => _searchStreamController.stream;
}