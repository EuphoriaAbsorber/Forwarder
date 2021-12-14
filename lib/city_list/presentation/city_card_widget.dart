import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

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

  @override
  Widget build(BuildContext context) => Hero(
        tag: widget.city.id,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            boxShadow: [BoxShadow(blurRadius: 2.0)],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    imageUrl: widget.city.imgSrc,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: Colors.transparent,
                            child: FittedBox(
                              child: Text(
                                widget.city.name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: FittedBox(
                            child: Row(
                              children: [
                                if (widget.city.filter.price == 2)
                                  const Icon(Icons.paid,
                                      color: Colors.yellow, size: 32.0),
                                if (widget.city.filter.sea == 2)
                                  const Icon(Icons.pool,
                                      color: Colors.blue, size: 32.0),
                                if (widget.city.filter.mountains == 2)
                                  const Icon(Icons.landscape,
                                      color: Colors.brown, size: 32.0),
                                if (widget.city.filter.culture == 2)
                                  const Icon(Icons.palette,
                                      color: Colors.red, size: 32.0),
                                if (widget.city.filter.nature == 2)
                                  const Icon(Icons.eco,
                                      color: Colors.lightGreenAccent,
                                      size: 32.0),
                                if (widget.city.filter.architecture == 2)
                                  const Icon(Icons.account_balance_rounded,
                                      color: Colors.grey, size: 32.0),
                                if (widget.city.filter.shopping == 2)
                                  const Icon(Icons.shopping_bag,
                                      color: Colors.orange, size: 32.0),
                                if (widget.city.filter.entertainment == 2)
                                  const Icon(Icons.attractions,
                                      color: Colors.deepPurple, size: 32.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.isFavorite
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
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
