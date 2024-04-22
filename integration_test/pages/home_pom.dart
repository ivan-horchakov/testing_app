import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class HomePagePOM {
  // Keys
  static final zeroItemHeartByKeyFinder = find.byKey(const Key('icon_0'));
  static final firstItemHeartByKeyFinder = find.byKey(const Key('icon_1'));
  static final secondItemHeartByKeyFinder = find.byKey(const Key('icon_2'));

  // Types
  static final listViewByTypeFinder = find.byType(ListView);

  // General Finder
  static Finder findItemsHeartByItsIndex(String itemIndex) {
    return find.byKey(ValueKey('icon_$itemIndex'));
  }

  // Reuseable 'tapThenPumpAndSettle' Future
  static Future tapThenPumpAndSettle(WidgetTester tester, Finder finder) async {
    await tester.tap(finder);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }
}
