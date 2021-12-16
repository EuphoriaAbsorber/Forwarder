import 'package:anyway/city_list/presentation/bottom_sheet_filter.dart';
import 'package:anyway/city_list/presentation/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:models/models.dart';

import '../lib/city_list/presentation/city_card_widget.dart';

void main() {
  testWidgets('Search Widget testing', (WidgetTester tester) async {

    final TextEditingController textController;
    textController = TextEditingController();
    await tester.pumpWidget(
        SearchWidget(textController: textController, text: 'Найди свое...',)
    );

    final finder = find.text('Найди свое...');
    expect(finder, findsWidgets);

    //await tester.pumpWidget(price)

    //expect(tester.widget('price'), equals(1));
  });
}
