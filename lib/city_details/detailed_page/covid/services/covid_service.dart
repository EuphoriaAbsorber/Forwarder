import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CovidService {
  Future<void> fetchCovidInfo() async {
    try {
      final Dio client = Dio();
      const url = 'https://api.covid19api.com/live/country/south-africa/status/confirmed/date/2021-12-08';
      var response = await client.get<Map<String, dynamic>>(url);
      final data = response.data;
      if (data != null) {
        var list = JsonSerializable.fromJson(data);
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
