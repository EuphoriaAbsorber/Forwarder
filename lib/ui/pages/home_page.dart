import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/widgets/city_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _textController;
  var _currentIndex = 1;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: _homeKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2.0,
          shadowColor: Colors.black38,
          title: SizedBox(
            height: 40.0,
            child: TextField(
              controller: _textController,
              scrollPhysics: const BouncingScrollPhysics(),
              cursorColor: Colors.deepOrange,
              style: const TextStyle(color: Colors.black, fontSize: 18.0),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.black54),
                suffixIcon: IconButton(
                  splashRadius: 16.0,
                  icon: const Icon(Icons.clear, color: Colors.black54),
                  onPressed: () => _textController.text = "",
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 4, 4, 16),
                hintText: 'Search your journey...',
                hintStyle:
                const TextStyle(color: Colors.black38, fontSize: 18.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.deepOrange, width: 2.0),
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
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        color: Colors.white,
                        height: 300,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
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
        ),
        body: Scrollbar(
          radius: const Radius.circular(8),
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: 32,
                itemBuilder: (BuildContext context, int index) {
                  return CityCard();
                }),
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: Colors.deepOrangeAccent,
              inactiveColor: Colors.black54,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.luggage),
              title: const Text('Journeys'),
              activeColor: Colors.deepOrangeAccent,
              inactiveColor: Colors.black54,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
              activeColor: Colors.deepOrangeAccent,
              inactiveColor: Colors.black54,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}