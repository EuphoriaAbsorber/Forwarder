import 'package:flutter/material.dart';
import 'package:untitled/ui/widgets/city_card_widget.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _homeKey = GlobalKey();
  final _appBarKey = GlobalKey();

  bool loading = true;
  List<CityCard> cities = [];
  int count = 0;

  void getCities() async{
    final dio = Dio();
    final response =   await dio.get('https://anyway-forwarder-serv.herokuapp.com');
    List<CityCard> s = [];
    for(var m in response.data){
      CityCard d = CityCard.fromJson(m);
      s.add(d);
    }
    setState(() {cities = s;loading = !loading;count = s.length;});
    //print(cities[0].title);
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
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
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
                      contentPadding: const EdgeInsets.fromLTRB(16, 4, 4, 16),
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
                      getCities();
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
          body: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              itemCount: count,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: cities[index],
                  onTap: () => Navigator.of(context)
                      .pushNamed("/details", arguments: {'id': index}),
                );
              }),
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
