import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/main.dart';

import 'pages/favorites_pom.dart';
import 'pages/home_pom.dart';

void main() {
  /// Emulator Run:
  /// make int_test

  group('INTEGRATION TESTS:', () {
    testWidgets('Favorites operations test', (tester) async {
      // Pumping the 'TestingApp' application
      await tester.pumpWidget(const TestingApp());

      // Tapping on the 0 Heart to add Favorite item
      await tester.tap(HomePagePOM.zeroItemHeartByKeyFinder);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Checking presence of the 'Added to favorites.' SnackBar's text
      expect(find.text('Added to favorites.'), findsOneWidget);

      // Tapping on the 1st Heart to add Favorite item
      await tester.tap(HomePagePOM.firstItemHeartByKeyFinder);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Checking presence of the 'Added to favorites.' SnackBar's text
      expect(find.text('Added to favorites.'), findsOneWidget);

      // Tapping on the 2nd Heart to add Favorite item
      await tester.tap(HomePagePOM.secondItemHeartByKeyFinder);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Checking presence of the 'Added to favorites.' SnackBar's text
      expect(find.text('Added to favorites.'), findsOneWidget);

      // Navigating to the 'Favorites' Page
      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();

      // Tapping on the 0 Cross to remove Favorite item
      await tester.tap(FavoritesPagePOM.zeroItemCrossByKeyFinder);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Checking presence of the 'Removed from favorites.' SnackBar's text
      expect(find.text('Removed from favorites.'), findsOneWidget);

      // Tapping on the 1st Cross to remove Favorite item
      await tester.tap(FavoritesPagePOM.firstItemCrossByKeyFinder);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Checking presence of the 'Removed from favorites.' SnackBar's text
      expect(find.text('Removed from favorites.'), findsOneWidget);

      // Tapping on the 2nd Cross to remove Favorite item
      await tester.tap(FavoritesPagePOM.secondItemCrossByKeyFinder);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Checking presence of the 'Removed from favorites.' SnackBar's text
      expect(find.text('Removed from favorites.'), findsOneWidget);
    });
  });
}
