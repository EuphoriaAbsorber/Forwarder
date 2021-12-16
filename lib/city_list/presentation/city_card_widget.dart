import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../../di.dart';

class CityCard extends StatelessWidget {
  final City city;
  final bool isFavorite;

  const CityCard({
    required this.city,
    required this.isFavorite,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cityManager = Dependencies.instance.cityManager;

    return Hero(
      tag: city.id,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: [
            BoxShadow(
                blurRadius: 6.0,
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0.0, 3.0))
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                fit: BoxFit.fitHeight,
                imageUrl: city.imgSrc,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: FittedBox(
                          child: Text(
                            city.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            if (city.filter.price == 2)
                              const Icon(Icons.paid,
                                  color: Colors.yellow, size: 32.0),
                            if (city.filter.sea == 2)
                              const Icon(Icons.pool,
                                  color: Colors.blue, size: 32.0),
                            if (city.filter.mountains == 2)
                              const Icon(Icons.landscape,
                                  color: Colors.brown, size: 32.0),
                            if (city.filter.culture == 2)
                              const Icon(Icons.palette,
                                  color: Colors.red, size: 32.0),
                            if (city.filter.nature == 2)
                              const Icon(Icons.eco,
                                  color: Colors.lightGreenAccent, size: 32.0),
                            if (city.filter.architecture == 2)
                              const Icon(Icons.account_balance_rounded,
                                  color: Colors.grey, size: 32.0),
                            if (city.filter.shopping == 2)
                              const Icon(Icons.shopping_bag,
                                  color: Colors.orange, size: 32.0),
                            if (city.filter.entertainment == 2)
                              const Icon(Icons.attractions,
                                  color: Colors.deepPurple, size: 32.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isFavorite
                      ? const Icon(Icons.favorite, color: Colors.redAccent)
                      : const Icon(Icons.favorite_border, color: Colors.red),
                ),
                onTap: () => isFavorite ? _cityManager.removeFromFavorites(city) : _cityManager.addToFavorites(city),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CityCard extends StatefulWidget {
//   final City city;
//   final bool isFavorite;
//
//   const CityCard({
//     required this.city,
//     required this.isFavorite,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<CityCard> createState() => _CityCardState();
// }
//
// class _CityCardState extends State<CityCard> {
//   final _cityManager = Dependencies.instance.cityManager;
//
//   @override
//   Widget build(BuildContext context) => Hero(
//         tag: widget.city.id,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.grey,
//             borderRadius: const BorderRadius.all(Radius.circular(16.0)),
//             boxShadow: [
//               BoxShadow(
//                   blurRadius: 6.0,
//                   color: Colors.black.withOpacity(0.5),
//                   offset: const Offset(0.0, 3.0))
//             ],
//           ),
//           clipBehavior: Clip.antiAlias,
//           child: Stack(
//             children: [
//               Positioned.fill(
//                 child: CachedNetworkImage(
//                   fit: BoxFit.fitHeight,
//                   imageUrl: widget.city.imgSrc,
//                   errorWidget: (context, url, error) => const Icon(Icons.error),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   height: 90,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(16.0)),
//                     color: Colors.white,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Material(
//                           color: Colors.transparent,
//                           child: FittedBox(
//                             child: Text(
//                               widget.city.name,
//                               style: const TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         FittedBox(
//                           child: Row(
//                             children: [
//                               if (widget.city.filter.price == 2)
//                                 const Icon(Icons.paid,
//                                     color: Colors.yellow, size: 32.0),
//                               if (widget.city.filter.sea == 2)
//                                 const Icon(Icons.pool,
//                                     color: Colors.blue, size: 32.0),
//                               if (widget.city.filter.mountains == 2)
//                                 const Icon(Icons.landscape,
//                                     color: Colors.brown, size: 32.0),
//                               if (widget.city.filter.culture == 2)
//                                 const Icon(Icons.palette,
//                                     color: Colors.red, size: 32.0),
//                               if (widget.city.filter.nature == 2)
//                                 const Icon(Icons.eco,
//                                     color: Colors.lightGreenAccent, size: 32.0),
//                               if (widget.city.filter.architecture == 2)
//                                 const Icon(Icons.account_balance_rounded,
//                                     color: Colors.grey, size: 32.0),
//                               if (widget.city.filter.shopping == 2)
//                                 const Icon(Icons.shopping_bag,
//                                     color: Colors.orange, size: 32.0),
//                               if (widget.city.filter.entertainment == 2)
//                                 const Icon(Icons.attractions,
//                                     color: Colors.deepPurple, size: 32.0),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.topRight,
//                 child: IconButton(
//                   icon: widget.isFavorite
//                       ? const Icon(Icons.favorite, color: Colors.red)
//                       : const Icon(Icons.favorite_border, color: Colors.grey),
//                   onPressed: () => _cityManager.addToFavorites(widget.city),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
// }
