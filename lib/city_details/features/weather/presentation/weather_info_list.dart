import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

import 'weather_info.dart';

class WeatherInfoList extends StatelessWidget {
  final List<Weather> weatherList;
  const WeatherInfoList({required this.weatherList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SizedBox(
        height: 120.0,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => WeatherInfo(
            temperature: weatherList[index]
                    .temperature
                    ?.celsius
                    ?.toStringAsFixed(1) ??
                '?',
            imgSrc: weatherList[index].weatherIcon ?? 'error',
            date: DateFormat.MMMd('ru')
                .format(weatherList[index].date ?? DateTime.now()),
            hour: DateFormat.Hm()
                .format(weatherList[index].date ?? DateTime.now()),
          ),
          itemCount: weatherList.length,
        ),
  );
}
