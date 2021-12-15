import 'package:flutter/material.dart';
import '../models/ticket_price_model.dart';
import '../tickets_service.dart';
import 'city_name_card.dart';

class TicketsWidget extends StatefulWidget {
  final String endCityName;
  final String airport;
  const TicketsWidget(this.endCityName, this.airport, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TicketsWidgetState();
}

class _TicketsWidgetState extends State<TicketsWidget> {
  String startCityName = 'Москва';

  Future<TicketPriceModel?> getTickets() async {
    final service = TicketsService();
    return service.fetchTickets(widget.airport);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<TicketPriceModel?>(
        future: getTickets(),
        builder: (context, snapshot) => snapshot.hasData
            ? Column(
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
                        CityNameCard(cityName: widget.endCityName)
                      ],
                    ),
                  ),
                  Center(
                      child: Padding(
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
                ],
              )
            : const Material(),
      );
}
