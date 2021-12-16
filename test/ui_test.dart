
import 'package:anyway/city_list/presentation/bottom_sheet_filter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:models/models.dart';

import '../lib/city_list/presentation/city_card_widget.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
// Create the widget by telling the tester to build it.
    await tester.pumpWidget(BottomSheetFilter(
        initFilter: Filter(
          price: 0,
          sea: 0,
          mountains: 0,
          culture: 0,
          architecture: 0,
          shopping: 0,
          entertainment: 0,
          nature: 0,
        ),
        onFilterChanged: false));

// Create the Finders.
    final titleFinder = find.text('name');
    final messageFinder = find.text('M');

// Use the `findsOneWidget` matcher provided by flutter_test to
// verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
