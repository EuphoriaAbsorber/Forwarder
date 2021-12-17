import 'package:dio/dio.dart';

import 'models/ticket_price_model.dart';

class TicketsService {
  Future<TicketPriceModel?> fetchTickets(String? cityAirport) async {
    try {
      final options = BaseOptions(queryParameters: {
        'token': 'cd472db01937d97c5a3ba5a12ca47ab0',
        'rapidapi-key': '7b184b96ecmshddca86e95d6b8d8p1e6a1bjsnbaf5607d0ffc',
        'page': 'None',
      });
      final client = Dio(options);
      const url =
          'http://api.travelpayouts.com/v2/prices/latest?period_type=year&page=1&limit=30&show_to_affiliates=true&sorting=price&trip_class=0';
      final response =
          await client.get<Map<String, dynamic>>(url, queryParameters: {
        'origin': 'SVO',
        'destination': cityAirport,
        'currency': 'RUB',
      });
      final data = response.data;
      if (data != null) {
        final ticketPrice = TicketPriceModel.fromJson(data);
        return ticketPrice;
      }
    } on DioError catch (e) {
      print(e.toString()); // :(
    }
  }
}
