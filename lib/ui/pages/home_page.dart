import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/pages/details_page.dart';
import 'package:untitled/ui/widgets/city_card_widget.dart';

import '../../di.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _textController;

  final _cityWorker = Dependencies.instance.cityWorker;
  late Future<Map<CityItem, bool>> _cityItemsFuture = _cityWorker.getLatest();

  final GlobalKey<ScaffoldState> _homeKey = GlobalKey();
  final _appBarKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: _homeKey,
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                key: _appBarKey,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0.0,
                title: SizedBox(
                  height: 40.0,
                  child: TextField(
                    controller: _textController,
                    scrollPhysics: const BouncingScrollPhysics(),
                    cursorColor: Colors.deepOrange,
                    style: const TextStyle(color: Colors.black, fontSize: 18.0),
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.black54),
                      suffixIcon: IconButton(
                        splashRadius: 16.0,
                        icon: const Icon(Icons.clear, color: Colors.black54),
                        onPressed: () => _textController.text = "",
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                      hintText: 'Search your journey...',
                      hintStyle: const TextStyle(
                          color: Colors.black38, fontSize: 18.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.deepOrange, width: 2.0),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    splashRadius: 24.0,
                    iconSize: 36.0,
                    splashColor: Colors.deepOrange.withOpacity(0.3),
                    icon: const Icon(
                      Icons.sort,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                          // barrierColor: Colors.bla.withOpacity(0.1),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(32.0)),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 300,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 8.0),
                                    Container(
                                      width: 64.0,
                                      height: 8.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0x7736382E),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.0)),
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    const Text('Modal BottomSheet'),
                                    const SizedBox(height: 8.0),
                                    ElevatedButton(
                                      child: const Text('Close BottomSheet'),
                                      onPressed: () => Navigator.pop(context),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  )
                ],
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: RefreshIndicator(
            onRefresh: () async {
              _cityItemsFuture = _cityWorker.getLatest();
              await _cityItemsFuture;
              setState(() {});
            },
            child: FutureBuilder<Map<CityItem, bool>>(
              future: _cityItemsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.requireData;
                  final cities = data.keys
                      .where((element) =>
                          element.name.contains(_textController.text))
                      .toList();
                  return GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: cities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: CityCard(
                              city: cities[index],
                              isFavorite: data[cities[index]] ?? false),
                          onTap: () => Navigator.pushNamed(
                            context,
                            "/details",
                            arguments: {
                              'id': cities[index].id,
                              'name': cities[index].name,
                              'imgSrc': cities[index].imgSrc,
                              'isFavorite': data[cities[index]] ?? false,
                            },
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Icon(Icons.error),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),

        // bottomNavigationBar: BottomNavyBar(
        //   selectedIndex: _currentIndex,
        //   itemCornerRadius: 24,
        //   curve: Curves.easeIn,
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   onItemSelected: (index) => setState(() => _currentIndex = index),
        //   items: <BottomNavyBarItem>[
        //     BottomNavyBarItem(
        //       icon: const Icon(Icons.home),
        //       title: const Text('Home'),
        //       activeColor: Colors.deepOrangeAccent,
        //       inactiveColor: Colors.black54,
        //       textAlign: TextAlign.center,
        //     ),
        //     BottomNavyBarItem(
        //       icon: const Icon(Icons.luggage),
        //       title: const Text('Journeys'),
        //       activeColor: Colors.deepOrangeAccent,
        //       inactiveColor: Colors.black54,
        //       textAlign: TextAlign.center,
        //     ),
        //     BottomNavyBarItem(
        //       icon: const Icon(Icons.settings),
        //       title: const Text('Settings'),
        //       activeColor: Colors.deepOrangeAccent,
        //       inactiveColor: Colors.black54,
        //       textAlign: TextAlign.center,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

// class FadeRoute extends PageRouteBuilder {
//   FadeRoute({required Widget page, required RouteSettings settings})
//       : super(
//           settings: settings,
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               page,
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) =>
//               FadeTransition(
//             opacity: animation,
//             child: child,
//           ),
//         );
// }
