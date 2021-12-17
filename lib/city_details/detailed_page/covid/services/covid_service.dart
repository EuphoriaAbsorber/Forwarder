import 'package:dio/dio.dart';

import '../models/covid_model.dart';

class CovidService {
  Future<List<CovidModel>?> fetchCovidInfo(String country) async {
    try {
      final client = Dio();
      print(country);
      //var lcountry = country.toLowerCase().split(' ').join('-');
      var lcountry = 'south-africa';
      var dateTo = DateTime.now().subtract(Duration(days: 1));
      var dateFrom = dateTo.subtract(Duration(days: 7));
      var url = 'https://api.covid19api.com/country/${lcountry}/status/confirmed/live?from=${dateFrom.toIso8601String()}&to=${dateTo.toIso8601String()}';
      print(url);
      final response = await client.get(url);
      final list = <CovidModel>[];
      final usedDates = <String?>{};
      for(Map<String, dynamic> date in response.data) {
        var item = CovidModel.fromJson(date as Map<String,dynamic>);
        if (!usedDates.contains(item.date)) {
          list.add(item);
          usedDates.add(item.date);
        }
      }
      print(list);
      return list;
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
