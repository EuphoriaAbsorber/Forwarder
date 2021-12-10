import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late int id;
  late String name;
  late String imgSrc;
  late bool isFavorite;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    id = arguments['id'] ?? -1;
    name = arguments['name'] ?? 'undefined';
    imgSrc = arguments['imgSrc'] ?? 'undefined';
    isFavorite = arguments['isFavorite'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: id,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: imgSrc,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            isFavorite ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_border, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(name, style: const TextStyle(fontSize: 64.0, fontWeight: FontWeight.bold)),
            ),
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
