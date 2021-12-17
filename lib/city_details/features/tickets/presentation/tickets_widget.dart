import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../info_widget.dart';
import '../models/ticket_price_model.dart';
import '../tickets_service.dart';

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
        builder: (context, snapshot) => snapshot.data?.data?.isNotEmpty ?? false
            ? InfoWidget(
                title: 'Билеты',
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            startCityName,
                            style: const TextStyle(fontSize: 24),
                          ),
                          const Icon(
                            Icons.arrow_right_alt_rounded,
                            color: Colors.black,
                          ),
                          Text(
                            widget.endCityName,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Самый дешёвый билет по данным за последние 2 дня стоит ${plurals(snapshot.data?.data?[0].price ?? 0)}.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const Material(),
      );

  String plurals(int quantity) => Intl.plural(quantity,
      zero: '... рублей',
      one: '$quantity рубль',
      few: '$quantity рубля',
      many: '$quantity рублей',
      name: 'рубль',
      args: [quantity],
      other: '$quantity рублей',
      locale: 'ru');
}
