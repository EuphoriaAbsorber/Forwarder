import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final int id;
  final String title;
  final String titleEng;
  final String country;
  final String imageUrl;
  final int price;
  final int sea;
  final int mountains;
  final int culture;
  final int architecture;
  final int shopping;
  final int entertainment;
  final int nature;

  const CityCard({Key? key,
    required this.id,
    required this.title,
    required this.titleEng,
    required this.country,
    required this.imageUrl,
    required this.price,
    required this.sea,
    required this.mountains,
    required this.culture,
    required this.architecture,
    required this.shopping,
    required this.entertainment,
    required this.nature,
  }) : super(key: key);

  CityCard.fromJson(Map<String, dynamic> json, {Key? key})
      : id = json['id'],
        title = json['title'],
        titleEng = json['title_eng'],
        country = json['country'],
        imageUrl = json['image_url'],
        price = json['price'],
        sea = json['sea'],
        mountains = json['mountains'],
        culture = json['culture'],
        architecture = json['architecture'],
        shopping = json['shopping'],
        entertainment = json['entertainment'],
        nature = json['nature'];

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2.0)],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageUrl,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
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
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            title,
                            style: const TextStyle(
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
                Align(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite, color: Colors.red,),
                  ),
                  alignment: Alignment.topRight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


