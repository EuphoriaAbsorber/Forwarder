import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

import 'weather_info.dart';

class WeatherInfoList extends StatelessWidget {
  final List<Weather> weatherList;
  const WeatherInfoList({required this.weatherList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 2.0)],
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Погода',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
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
            ),
          ],
        ),
      );
}
