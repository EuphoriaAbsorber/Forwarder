import 'package:flutter/material.dart';
import 'package:untitled/detailed_page/weather/services/weather_service.dart';

import '../../../city.dart';
import '../weather_model.dart';

class WeatherWidget extends StatefulWidget { // Хз statefl или stateless
  final String title;
  const WeatherWidget({Key? key, required this.title}): super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget>{
  City city = City('Chicago','US');
  WeatherModel? _months;
  
  Future<WeatherModel?> getWeather() async{
    WeatherService service = WeatherService();
    await service.fetchWeather();
  }

  @override
  void initState() {
    super.initState();
    getWeather().then((value) {
      _months = value;
      print(_months.toString);});
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
              //Flexible(child: WeatherGraphic('graphic')),
            ],
          ),
        ),
    );
  }
}