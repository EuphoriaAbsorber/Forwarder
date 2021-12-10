import 'package:dio/dio.dart';

class TicketsService {
  Future<void> fetchTickets() async {
    try {
      final options = BaseOptions(queryParameters: {
        'token': 'cd472db01937d97c5a3ba5a12ca47ab0',
        'rapidapi-key': '7b184b96ecmshddca86e95d6b8d8p1e6a1bjsnbaf5607d0ffc',
        'page': 'None',
      });
      final Dio client = Dio(options);
      const url =
          'https://travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com/v1/prices/cheap';
      var response = await client.get(url, queryParameters: {
        'origin': 'MOW',
        'destination': 'LED',
        'currency': 'RUB',
      });
      var tickets = response.data;
      //print(tickets);
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
