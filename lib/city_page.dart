import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/tickets/tickets_widget.dart';
import 'package:untitled/weather/presentation/weather_widget.dart';

import 'city.dart';
import 'image/image_widget.dart';
import 'news/presentation/news_widget.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  City city = City('Cleveland', 'US');

  @override
  Widget build(BuildContext context) {
        return Column(
           children: const [
             ImageWidget(title: 'image'),
            Text(
              'City', //TODO: добавить название города
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
             TicketsWidget(title: 'tickets'),
             WeatherWidget(title: 'weather'),
             NewsWidget(title: 'news'),
           ],
       );
  }

}
/*List<int>? getTemperature() {
  return null;
}

String? getContry() {
  return null;
}

double? getTicketCost() {
  return null;
}

String? getVisaAdvice() {
  //if text is large, maybe better use stream
  return null;
}*/