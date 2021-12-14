import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swipe_cards/swipe_cards.dart';


class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);


  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = <String>["Red", "Blue", "Green", "Yellow", "Orange"];
  List<Color> _colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];
  @override
  void initState() {
    for (var i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {

          },
          nopeAction: () {

          },
          superlikeAction: () {
            Navigator.pop(context);
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      body: Column(children: [
        SizedBox(
          height: 550,
          child: SwipeCards(
            matchEngine: _matchEngine,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: _swipeItems[index].content.color as Color,
                child: Text(
                  _swipeItems[index].content.text as String,
                  style: TextStyle(fontSize: 100),
                ),
              );
            },
            onStackFinished: () {
              Navigator.pop(context);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  _matchEngine.currentItem?.nope();
                },
                child: Text("Нет")),
            ElevatedButton(
                onPressed: () {
                  //_matchEngine.currentItem?.superLike();
                  Navigator.pop(context);
                },
                child: Text("Закрыть")),
            ElevatedButton(
                onPressed: () {
                  _matchEngine.currentItem?.like();
                },
                child: Text("Да"))
          ],
        )
      ]));
}

class Content {
  final String text;
  final Color color;

  Content({required this.text, required this.color});
}