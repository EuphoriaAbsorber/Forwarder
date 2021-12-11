import 'package:data/data.dart';
import 'package:dio/dio.dart';

import 'city_network_model.dart';

final CITY_API_PATH = 'https://anyway-forwarder-serv.herokuapp.com';

class CityApiImpl extends CityApi {
  final Dio _dio;

  CityApiImpl(this._dio);

  @override
  Future<List<CityItem>> getLatest() async {
    final response = await _dio.get(CITY_API_PATH);

    var cities = <CityItem>[];

    for(var c in response.data) {
      cities.add(CityNetworkModel.fromJson(c).toCityItem());
    }

    return cities;
  }
}
