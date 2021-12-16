import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityNameCard extends StatelessWidget {
  String cityName;
  CityNameCard({Key? key, required this.cityName}): super(key: key);
  @override
  Widget build(BuildContext context) => Text(
      cityName,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
    );
}