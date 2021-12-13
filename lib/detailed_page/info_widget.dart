import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  //CityItem city;
  final String title;
  final Widget child;

  const InfoWidget({Key? key, required this.title, required this.child }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        //width: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 30,),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}