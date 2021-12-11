import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget{

  final String? title;


  const CityCard({
    Key? key,
    this.title,
  }) : super(key: key);

  CityCard.fromJson(Map<String, dynamic> json, {Key? key})
    : title = json['title'], super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card (
      margin: const EdgeInsets.all(10),
      color: Colors.green[100],
      child: SizedBox(
          height: 100,
          child: Text(title!)
      ),
    );
  }
}