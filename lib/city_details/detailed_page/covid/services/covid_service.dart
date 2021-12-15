import 'dart:convert';

import 'package:anyway/city_details/detailed_page/covid/models/covid_model.dart';
import 'package:dio/dio.dart';

class CovidService {
  Future<void> fetchCovidInfo() async {
    try {
      final Dio client = Dio();
      const url = 'https://api.covid19api.com/live/country/south-africa/status/confirmed/date/2021-12-08';
      var response = await client.get(url);
      var data = response.data;
      if (data != null) {
        var list = jsonDecode(response.data.toString());
        var covid = 0;
        /*List<CovidModel> covidData = List<CovidModel>.from(
            parser.map((model) => CovidModel().fromJson(model)));*/
      }
      //jsonDecode(response.data);
      //print(covid);
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
