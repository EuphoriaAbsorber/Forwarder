import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swipe_cards/swipe_cards.dart';


class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);


  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final List<String> _names = <String>[
    'Что думаете по поводу поездки ',
    'Не хотите отправиться ',
    'Что насчёт поездки '
  ];
  final List<String> _namesPart2 = <String>[
    'на море?',
    'в горы?',
    'на природу?'
  ];

  final List<String> _names2 = <String>[
    'Хотите посетить ',
    'Собираетесь посетить ',
    'Отправитесь в ',
  ];

  final List<String> _names2Part2 = <String>[
    'музеи, театры или галереи?',
    'торговые центры и магазины сувениров?',
    'развлекательные места?'
  ];
  final List<String> _names3 = <String>[
    'Важна ли вам ',
    'Имеет ли значение ',
  ];

  final List<String> _names3Part2 = <String>[
    'архитектура города?',
    'бюджетность поездки?'
  ];

  @override
  void initState() {
    List<String> questions = <String>[];
    for (var i = 0; i < _namesPart2.length; i++) {
      questions.add(_names[Random().nextInt(_namesPart2.length)] + _namesPart2[i]);
    }
    for (var i = 0; i < _names2Part2.length; i++) {
      questions.add(_names2[Random().nextInt(_names2Part2.length)] + _names2Part2[i]);
    }
    for (var i = 0; i < _names3Part2.length; i++) {
      questions.add(_names3[Random().nextInt(_names3Part2.length)] + _names3Part2[i]);
    }
    questions.shuffle();
    for (var i = 0; i < 8; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: questions[i]),
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
          height: 650,
          child: SwipeCards(
            matchEngine: _matchEngine,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.white,

                child: Text(
                  _swipeItems[index].content.text as String,
                  style: TextStyle(fontSize: 20),
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

  Content({required this.text});
}