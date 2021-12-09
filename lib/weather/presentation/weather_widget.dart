import 'package:flutter/material.dart';
import 'package:untitled/weather/presentation/weather_graphic.dart';
import 'package:untitled/weather/services/weather_service.dart';

import '../../city.dart';

class WeatherWidget extends StatefulWidget { // Хз statefl или stateless
  final String title;
  const WeatherWidget({Key? key, required this.title}): super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget>{
  City city = City('Chicago','US');
  Future<void> getWeather() async{
    WeatherService service = WeatherService();
    service.fetchWeather();
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
      return Padding (
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Погода", style: TextStyle(color: Colors.white, fontSize: 30),),
              Flexible(child: WeatherGraphic()),
            ],
          ),
        ),
    );
  }
}