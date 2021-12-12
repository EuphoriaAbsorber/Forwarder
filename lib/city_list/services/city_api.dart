import 'package:dio/dio.dart';
import 'package:models/models.dart';

const cityApiPath = '/';

class CityApi {
  final Dio _dio;

  CityApi(this._dio);

  Future<List<City>> getLatest() async {
    final response = await _dio.get(cityApiPath);
    final cityList = CityListNetworkModel.fromJson(response.data as Map<String, dynamic>).cityList.map((e) => e.toCityItem()).toList();
    return cityList;
  }
}
