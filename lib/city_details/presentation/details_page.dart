import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late City city;
  late bool isFavorite;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    city = arguments['city'] as City? ??
        City(
          id: -1,
          name: 'undefined',
          imgSrc: 'undefined',
          filter: Filter(
            price: 0,
            sea: 0,
            mountains: 0,
            culture: 0,
            architecture: 0,
            shopping: 0,
            entertainment: 0,
            nature: 0,
          ),
          country: 'undefined',
          coords: 'undefined',
          description: 'undefined',
        );
    isFavorite = arguments['isFavorite'] as bool? ?? false;
  }

  @override
  Widget build(BuildContext context) => Hero(
        tag: city.id,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: city.imgSrc,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                if (isFavorite)
                  const Icon(Icons.favorite, color: Colors.red)
                else
                  const Icon(Icons.favorite_border, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                      color: Colors.transparent,
                      child: Text(city.name,
                          style: const TextStyle(
                              fontSize: 64.0, fontWeight: FontWeight.bold))),
                ),
                ElevatedButton(
                  child: const Material(
                      color: Colors.transparent, child: Text('Close')),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        ),
      );
}
