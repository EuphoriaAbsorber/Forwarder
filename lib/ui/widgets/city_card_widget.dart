import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../../di.dart';

class CityCard extends StatefulWidget {
  final City city;
  bool isFavorite;

  CityCard({
    required this.city,
    required this.isFavorite,
    Key? key,
  }) : super(key: key);

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  final _cityWorker = Dependencies.instance.cityWorker;

  @override
  Widget build(BuildContext context) => Hero(
      tag: widget.city.id,
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
                  fit: BoxFit.fitHeight,
                  imageUrl: widget.city.imgSrc,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
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
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            widget.city.name,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
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
              ),
              Align(
                alignment: Alignment.topRight,
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () => _addToFavorite(widget.city),
                    icon: widget.isFavorite
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  void _addToFavorite(City item) {
    if (widget.isFavorite) {
      _cityWorker.removeFromFavorites(item);
      widget.isFavorite = false;
      //_showSnack('Удалено из избраного');
    } else {
      _cityWorker.addToFavorites(item);
      widget.isFavorite = true;
      //_showSnack('Добавлено в избранные');
    }
    setState(() {});
  }

  void _showSnack(String text) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));
}

class BottomDialog {
  static void show(BuildContext context, {Widget? title, Widget? body}) {
    showModalBottomSheet(
      barrierColor: Theme.of(context).shadowColor.withOpacity(0.1),
      elevation: 0.5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 8,
                        width: 56,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: DefaultTextStyle(
                        style: Theme.of(context).textTheme.headline1!,
                        child: title ?? Spacer(),
                      ),
                    ),
                    Center(child: body),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}
