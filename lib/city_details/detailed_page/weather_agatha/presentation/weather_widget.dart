import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

List<double> testMonthsData = [-3, -1, 13, 18, 22, 25, 25, 20, 16, 10, 0, -5];
/*List<String> monthsShortNames = [
  'Я',
  'Ф',
  'М',
  'А',
  'М',
  'И',
  'И',
  'А',
  'С',
  'О',
  'Н',
  'Д'
];*/
/*List<String> monthsNames = [
  'Январь',
  'Февраль',
  'Март',
  'Апрель',
  'Май',
  'Июнь',
  'Июль',
  'Август',
  'Сентябрь',
  'Октябрь',
  'Ноябрь',
  'Декабрь',
];*/

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late List<Weather> forecast = [];
  bool isRead = false;
  List<int> t5 = [0, 0, 0, 0, 0];
  List<DateTime> dates = [];

  Future<List<Weather>?> getWeather() async {
    final wf = WeatherFactory('660591836ec3ecb62d7152096a6026b5',
        language: Language.RUSSIAN);
    final forecast = await wf.fiveDayForecastByCityName('London');
    return forecast;
  }
  void makeList(List<Weather>? w5) {
    if (w5 != null) {
      for (var i = 0; i < 5; i += 1) {
        dates.add(w5[8*i].date!);
        t5[i] = w5[8*i].temperature!.celsius!.toInt();
      }
      isRead = true;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  final Color barBackgroundColor = Colors.grey;
  final Color backgroundColor = Colors.black26;
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) => AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: backgroundColor,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FutureBuilder<List<Weather>?>(
                          future: getWeather(),
                          builder: (context, snapshot) {
                            makeList(snapshot.data);
                            return BarChart(
                              barData(),
                              swapAnimationDuration: animDuration,
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  BarChartData barData() {
    final maxTemp = t5.reduce(max);
    final minTemp = t5.reduce(min);
    return BarChartData(
      maxY: maxTemp + 1,
      minY: min(minTemp.toDouble(), 0),
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
            /*monthsNames[group.x.toInt()] +*/ '',
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '${(rod.y - 1).toStringAsFixed(0)}°C',
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(
          showTitles: false,
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) =>
          const TextStyle(color: Colors.white, fontSize: 15),
          getTitles: (value) => dates.isEmpty?'':'${dates[value.toInt()].day}.${dates[value.toInt()].month}',
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            if(value == minTemp || value == maxTemp) {
              return '${value.toStringAsFixed(0)}°C';
            }
            return '';
          },
          interval: 1,
          reservedSize: 40,
          getTextStyles: (context, value) =>
          const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(t5),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        checkToShowHorizontalLine: (value) => value.toInt() == minTemp.toInt() || value.toInt() == maxTemp.toInt(),
        getDrawingHorizontalLine: (value) {
          if(isRead){
            return FlLine(color: Colors.amber, strokeWidth: 1);
          }
          return FlLine(color: Colors.transparent);
        }
      ),
    );
  }

  List<BarChartGroupData> showingGroups(List<int> monthData) =>
      List.generate(t5.length,
          (i) => makeGroupData(i, monthData[i].toDouble(), isTouched: i == touchedIndex));

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 24,
    List<int> showTooltips = const [],
  }) => BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.yellow)
              : const BorderSide(color: Colors.white, width: 0),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
  }
}
