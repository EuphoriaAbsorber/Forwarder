import 'package:models/models.dart';
import 'base_state.dart';

class CityListState extends BaseState<List<CityWithStatus>> {
  CityListState({required List<CityWithStatus> initState}) : super(state: initState);

  void setFlag(City city, {required bool isFavorite}) {
    for(var i = 0; i<state.length; ++i) {
      if(state[i].city.id == city.id) {
        state[i] = CityWithStatus(city: city, isFavorite: isFavorite);
        break;
      }
    }
    update(state);
  }
}