import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2.0)],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://media.architecturaldigest.com/photos/58f918044f42bd463db36a3f/16:9/w_1280,c_limit/1%20-%2010%20Greenest%20Cities%20in%20America%20in%202017.jpg"),
          ),
        ),
        child: Stack(
          children: [
            Align(
              child: FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.favorite),
                  backgroundColor: Colors.deepOrangeAccent),
              alignment: Alignment.topRight,
            ),
            Align(
              child: Container(
                height: 90,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Any city name",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.ac_unit_rounded,
                              color: Colors.lightBlueAccent, size: 32.0),
                          Icon(Icons.account_balance_rounded,
                              color: Colors.grey, size: 32.0),
                          Icon(Icons.air_rounded,
                              color: Colors.cyanAccent, size: 32.0),
                          Icon(Icons.eco,
                              color: Colors.lightGreenAccent, size: 32.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      );
  }
}


