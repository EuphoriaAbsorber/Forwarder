import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../info_widget.dart';
import '../models/covid_model.dart';
import '../services/covid_service.dart';

List<Color> gradientColors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
];

class CovidWidget extends StatelessWidget {
  final String country;
  const CovidWidget(this.country, {Key? key}) : super(key: key);

  Future<List<CovidModel>?> getCovidData() async {
    final service = CovidService();
    return service.fetchCovidInfo(country);
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<List<CovidModel>?>(
        future: getCovidData(),
        builder: (context, snapshot) => snapshot.data != null
            ? InfoWidget(
                title: 'Covid-19',
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'График количества заболевших в стране.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 1.70,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 18.0, left: 12.0, top: 24, bottom: 12),
                          child: LineChart(
                            mainData(snapshot.data),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const Material(),
      );

  LineChartData mainData(List<CovidModel>? covidData) {
    final list = List.generate(covidData?.length ?? 5,
        (index) => covidData?[index].confirmed?.toDouble() ?? index);
    final dates = List.generate(
        covidData?.length ?? 5,
        (index) => DateTime.parse(
            covidData?[index].date ?? DateTime.now().toString()));
    final maxItem = list.reduce(max);
    final minItem = list.reduce(min);
    for (var i = 0; i < list.length; i++) {
      list[i] =
          (list[i] - minItem) / (maxItem - minItem) * 6 + minItem / maxItem;
    }
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
            maxContentWidth: 100,
            tooltipBgColor: Colors.blueGrey,
            getTooltipItems: (touchedSpots) => touchedSpots.map((touchedSpot) {
                  const textStyle = TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  );
                  return LineTooltipItem(
                      (covidData?[touchedSpot.x.toInt()].confirmed)
                              ?.toStringAsFixed(0) ??
                          '',
                      textStyle);
                }).toList()),
      ),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) => FlLine(
          color: Colors.grey,
          strokeWidth: 1,
        ),
        getDrawingHorizontalLine: (value) => FlLine(
          color: Colors.grey,
          strokeWidth: 1,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: false,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
        topTitles: SideTitles(
            showTitles: true,
            getTitles: (value) => (value * 2.toInt()) % 4 == 0
                ? '${dates[value.toInt()].day}.${dates[value.toInt()].month}'
                : ''),
        rightTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey),
      ),
      minX: 0,
      maxX: list.length.toDouble() - 1,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            list.length,
            (i) => FlSpot(
              i.toDouble(),
              list[i].toDouble(),
            ),
          ),
          isCurved: true,
          colors: [
            ColorTween(
              begin: gradientColors[0],
              end: gradientColors[1],
            ).lerp(0.2)!,
            ColorTween(
              begin: gradientColors[0],
              end: gradientColors[1],
            ).lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: [
              ColorTween(
                begin: gradientColors[0],
                end: gradientColors[1],
              ).lerp(0.2)!.withOpacity(0.1),
              ColorTween(
                begin: gradientColors[0],
                end: gradientColors[1],
              ).lerp(0.2)!.withOpacity(0.1),
            ],
          ),
        ),
      ],
    );
  }
}
