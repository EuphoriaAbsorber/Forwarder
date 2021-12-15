import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  final String temperature;
  final String date;
  final String imgSrc;
  final String hour;

  const WeatherInfo({
    required this.temperature,
    required this.date,
    required this.imgSrc,
    required this.hour,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 80.0,
      width: 60.0,
      child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      temperature,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Text(
                      '°C',
                      style: TextStyle(color: Colors.black, fontSize: 10.0),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: CachedNetworkImage(
                  height: 40.0,
                  width: 40.0,
                  imageUrl: imageUrl,
                  placeholder: (context, _) => const Center(
                    child: SizedBox(
                      height: 20.0,
                      width: 20.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.black, fontSize: 10.0),
              ),
              Text(
                hour,
                style: const TextStyle(color: Colors.black, fontSize: 10.0),
              ),
            ],
          ),
    ),
  );

  String get imageUrl => 'https://openweathermap.org/img/wn/$imgSrc@2x.png';
}
