import 'package:anyway/city_details/detailed_page/covid/models/covid_model.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CovidService {
  Future<List<CovidModel>?> fetchCovidInfo() async {
    try {
      final Dio client = Dio();
      const url = 'https://api.covid19api.com/live/country/south-africa/status/confirmed/date/2021-12-08';
      var response = await client.get(url);
      final list = <CovidModel>[];
      for(final date in response.data) {
        list.add(CovidModel.fromJson(date));
      }
      return list;
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
