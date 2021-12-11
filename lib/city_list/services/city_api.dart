import 'package:dio/dio.dart';
import 'package:models/models.dart';

const cityApiPath = '/';

class CityApi {
  final Dio _dio;

  CityApi(this._dio);

  Future<List<CityItem>> getLatest() async {
    final response = await _dio.get(cityApiPath);
    final cityList = CityListNetworkModel
        .fromJson(response.data as Map<String,dynamic>)
        .cityList;
    return cityList.map((e) => e.toCityItem()).toList();
    // final cities = <CityItem>[];
    // for(final c in response.data) {
    //   cities.add(CityNetworkModel.fromJson(c).toCityItem());
    // }
    //
    // return cities;
  }
}
