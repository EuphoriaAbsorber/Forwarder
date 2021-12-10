import 'package:flutter/material.dart';

import '../../city.dart';
import 'tickets_service.dart';

class TicketsWidget extends StatefulWidget {
  final String title;

  const TicketsWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TicketsWidgetState();
}

class _TicketsWidgetState extends State<TicketsWidget> {
  City city = City('Chicago', 'US');

  Future<void> getTickets() async {
    TicketsService service = TicketsService();
    service.fetchTickets();
  }

  @override
  void initState() {
    super.initState();
    getTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            const Text(
              "Билеты",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
