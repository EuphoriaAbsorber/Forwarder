import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: const [
          Text(
            "news title",
            style: TextStyle(color: Colors.blue, fontSize: 30),
          ),
          Text(
            "news description",
            style: TextStyle(color: Colors.blue, fontSize: 20),
          )
        ],
      ),
    );
  }
}
