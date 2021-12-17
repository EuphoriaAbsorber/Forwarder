import 'package:dio/dio.dart';

import '../models/covid_model.dart';

class CovidService {
  Future<List<CovidModel>?> fetchCovidInfo(String country) async {
    try {
      final client = Dio();

      final lcountry = country.toLowerCase().split(' ').join('-');

      final dateTo = DateTime.now().subtract(const Duration(days: 1));
      final dateFrom = dateTo.subtract(const Duration(days: 7));
      final url = 'https://api.covid19api.com/country/$lcountry/status/confirmed/live?from=${dateFrom.toIso8601String()}&to=${dateTo.toIso8601String()}';
      final response = await client.get(url);
      final list = <CovidModel>[];

      for (final date in response.data) {
        list.add(CovidModel.fromJson(date as Map<String, dynamic>));

        final usedDates = <String?>{};
        for (final Map<String, dynamic> date in response.data) {
          final item = CovidModel.fromJson(date);
          if (!usedDates.contains(item.date)) {
            list.add(item);
            usedDates.add(item.date);
          }
        }
        return list;
      }
    } on DioError catch (e) {
        print(e.toString()); // :(
    }
  }
}
