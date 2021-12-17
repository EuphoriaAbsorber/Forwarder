import 'package:anyway/city_list/presentation/filter_choice_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  Widget createWidgetForTesting({required Widget child})=> MaterialApp(
      home: child,
    );
  
  testWidgets('Filter choice chip Widget', (WidgetTester tester) async {

    const testKey = Key('testKey');

    await tester.pumpWidget(createWidgetForTesting(
      child: Scaffold(
        body: FilterChoiceChip(
          selected: false,
          onSelected: (bool selected) => selected = !selected,
          category: 'дёшево',
          icon: const Icon(
            Icons.paid,
            color: Colors.yellow,
          ),
          key: testKey,
        ),
      ),
    )
    );

    final keyFinder = find.byKey(testKey);
    final textFinder = find.text('дёшево');

    expect(textFinder, findsOneWidget);
    expect(keyFinder, findsOneWidget);
  });
}
