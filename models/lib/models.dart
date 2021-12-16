export 'src/base/city.dart';
export 'src/base/coords.dart';
export 'src/base/filter.dart';
export 'src/database/city_hive_model.dart';
export 'src/database/coords_hive_model.dart';
export 'src/database/filter_hive_model.dart';
export 'src/network/city_list_network_model.dart';
export 'src/network/city_network_model.dart';
export 'src/network/coords_network_model.dart';

class Pair<T,R> {
  final T first;
  final R second;
  const Pair({required this.first, required this.second});
}