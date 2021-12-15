import 'package:dio/dio.dart';

import '../models/covid_model.dart';

class CovidService {
  Future<List<CovidModel>?> fetchCovidInfo(String country) async {
    try {
      final Dio client = Dio();
      print(country);
      //var lcountry = country.toLowerCase().split(' ').join('-');
      var lcountry = 'south-africa';
      var dateTo = DateTime.now().subtract(Duration(days: 1));
      var dateFrom = dateTo.subtract(Duration(days: 7));
      var url = 'https://api.covid19api.com/country/${lcountry}/status/confirmed/live?from=${dateFrom.toIso8601String()}&to=${dateTo.toIso8601String()}';
      print(url);
      var response = await client.get(url);
      final list = <CovidModel>[];
      for(var date in response.data) {
        list.add(CovidModel.fromJson(date));
      }
      return list;
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
