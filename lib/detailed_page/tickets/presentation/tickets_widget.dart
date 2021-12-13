import 'package:flutter/material.dart';

import '../../../city.dart';
import '../models/ticket_price_model.dart';
import '../tickets_service.dart';
import 'city_name_card.dart';

class TicketsWidget extends StatefulWidget {
  const TicketsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TicketsWidgetState();
}

class _TicketsWidgetState extends State<TicketsWidget> {
  City city = City('Chicago', 'US');
  String startCityName = 'Москва';
  String endCityName = 'Санкт-Петербург';
  String? ticketsCost;

  Future<TicketPriceModel?> getTickets() async {
    final service = TicketsService();
    return service.fetchTickets();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CityNameCard(cityName: startCityName),
                const Icon(
                  Icons.arrow_right_alt_rounded,
                  color: Colors.black,
                ),
                CityNameCard(cityName: endCityName)
              ],
            ),
          ),
          Center(
            child: FutureBuilder<TicketPriceModel?>(
                future: getTickets(),
                builder: (context, snapshot) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Самый дешёвый билет за 2 дня стоит ${snapshot.data?.data?[0].price}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    )),
          ),
        ],
      );
}
