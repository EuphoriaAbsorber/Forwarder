import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherGraphic extends StatefulWidget {
  const WeatherGraphic({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherGraphicState();

}

class _WeatherGraphicState extends State<WeatherGraphic>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Text('Data');
  }

}