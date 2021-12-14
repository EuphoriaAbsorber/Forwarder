import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  @override
  Widget build(BuildContext context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 20,
              width: 20,
              child: FittedBox(
                child: Text(
                  '13',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(
                '°C',
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: CachedNetworkImage(
            imageUrl: 'https://ssl.gstatic.com/onebox/weather/64/cloudy.png',
            placeholder: (context, _) => const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
              ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Dec 18',
          style: TextStyle(color: Colors.black, fontSize: 10),
        )
      ],
    );
}
