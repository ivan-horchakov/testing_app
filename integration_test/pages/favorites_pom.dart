import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class FavoritesPagePOM {
  // Separated Keys
  static final zeroItemCrossByKeyFinder = find.byKey(const Key('remove_icon_0'));
  static final firstItemCrossByKeyFinder = find.byKey(const Key('remove_icon_1'));
  static final secondItemCrossByKeyFinder = find.byKey(const Key('remove_icon_2'));

  // General Finder
  static Finder findItemsCrossByItsIndex(String itemIndex) {
    return find.byKey(ValueKey('remove_icon_$itemIndex'));
  }
}
