import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/pages/favorites.dart';

late Favorites favoritesList;

/*
The createFavoritesScreen() function is used to create an app that loads the widget to be tested in a MaterialApp, 
wrapped into a ChangeNotifierProvider. The FavoritesPage widget needs both of these widgets to be present above it
in the widget tree so it can inherit from them and get access to the data they offer. This function is passed
as a parameter to the pumpWidget() function.
 */
Widget createFavoritesScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) {
        favoritesList = Favorites();
        return favoritesList;
      },
      child: const MaterialApp(
        home: FavoritesPage(),
      ),
    );

void addItems() {
  for (var i = 0; i < 10; i += 2) {
    favoritesList.add(i);
  }
}

void main() {
  /// Headless Run:
  /// make widget-favorites

  /// Emulator Run (for developing/debugging):
  /// make widget-favorites-emu

  group('Favorites Page WIDGET TESTS:', () {
    testWidgets('Test if ListView shows up', (tester) async {
      // Pumping the 'FavoritesPage' widget
      await tester.pumpWidget(createFavoritesScreen());

      // Adding some Items to Favorites
      addItems();
      await tester.pumpAndSettle();

      // Checking presence of the 'ListView'
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Testing Remove Button', (tester) async {
      // Pumping the 'FavoritesPage' widget
      await tester.pumpWidget(createFavoritesScreen());

      // Adding some Items to Favorites
      addItems();
      await tester.pumpAndSettle();

      // Getting value of the Favorite Items
      var totalItems = tester.widgetList(find.byIcon(Icons.close)).length;

      // Tapping on first 'Icons.close' widget to remove one Favorite Item
      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle();

      // Checking that the value of the Favorite Items decreased by 1
      expect(
        tester.widgetList(find.byIcon(Icons.close)).length,
        lessThan(totalItems),
      );

      // Checking presence of the 'Removed from favorites.' SnackBar's text
      expect(find.text('Removed from favorites.'), findsOneWidget);
    });
  });
}
