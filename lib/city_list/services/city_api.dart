import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:models/models.dart';

const cityApiPath = '/';

List<City> _parseJson(Map<String, dynamic> json) => CityListNetworkModel.fromJson(json).cityList.map((e) => e.toCityItem()).toList();

class CityApi {
  final Dio _dio;

  CityApi(this._dio);

  Future<List<City>> getLatest() async {
    final response = await _dio.get(cityApiPath);
    //return _parseJson(response.data as Map<String, dynamic>);
    return compute(_parseJson, response.data as Map<String, dynamic>);
  }
}

