import 'dart:async';

import 'package:models/models.dart';

class StateController {
  final List<Pair<City, bool>> _currentCityData = [];

  final _cityListStreamController = StreamController<List<Pair<City, bool>>>.broadcast();

  void updateCityList(List<Pair<City, bool>> data) => _cityListStreamController.add(data);

  void setCityFlag(City city, bool flag) {
    for(var i = 0; i<_currentCityData.length; ++i) {
      if(_currentCityData[i].first.id == city.id) {
        _currentCityData[i] = Pair(first: city, second: flag);
        break;
      }
    }
    updateCityList(_currentCityData);
  }

  Stream<List<Pair<City, bool>>> get cityListStream => _cityListStreamController.stream;

  Filter _currentFilter = Filter(
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
    _currentFilter = data;
    _filterStreamController.add(_currentFilter);
  }
  Stream<Filter> get filterStream => _filterStreamController.stream;


  String _search = "";

  final _searchStreamController = StreamController<String>.broadcast();
  void updateSearch(String data) {
    _search = data;
    _searchStreamController.add(_search);
  }
  Stream<String> get searchStream => _searchStreamController.stream;
}