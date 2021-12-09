import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget{

  final String? title;
  final String? image_url;
  final String? description;
  final int? price;
  final int? sea;
  final int? mountains;
  final int? culturelvl;
  final int? climate;

  const CityCard({
    Key? key,
    this.title,
    this.image_url,
    this.description,
    this.price,
    this.sea,
    this.mountains,
    this.culturelvl,
    this.climate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card (
      margin: const EdgeInsets.all(10),
      color: Colors.green[100],
      child: Container(
          height: 100,
          child: Text(title)
      ),
    );
  }
}