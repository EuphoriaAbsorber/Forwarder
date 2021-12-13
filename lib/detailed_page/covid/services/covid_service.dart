import 'package:dio/dio.dart';

class CovidService {
  Future<void> fetchCovidInfo() async {
    try {
      /*final Dio client = Dio();
      const url = 'https://api.covid19api.com/total/dayone/country/russian-federation/';
      //var response = await client.get(url);
      //var covid = 0;//jsonDecode(response.data);
      //print(covid);*/
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
