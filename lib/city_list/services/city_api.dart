import 'package:dio/dio.dart';
import 'package:models/models.dart';

const cityApiPath = '/';

class CityApi {
  final Dio _dio;

  CityApi(this._dio);

  Future<List<City>> getLatest() async {
    final response = await _dio.get(cityApiPath);
    print(response);
    final cityList =
        CityListNetworkModel.fromJson(response.data as Map<String, dynamic>)
            .cityList;

    for(final c in cityList) {
      print(c.toCityItem());
    }

    return cityList.map((e) => e.toCityItem()).toList();
  }
}
