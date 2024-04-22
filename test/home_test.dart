import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/pages/home.dart';

/*
The createHomeScreen() function is used to create an app that loads the widget to be tested in a MaterialApp, 
wrapped into a ChangeNotifierProvider. The HomePage widget needs both of these widgets to be present above it
in the widget tree so it can inherit from them and get access to the data they offer. This function is passed
as a parameter to the pumpWidget() function.
 */
Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  /// Headless Run:
  /// make widget-home

  /// Emulator Run (for developing/debugging):
  /// make widget-home-emu

  group('Home Page WIDGET TESTS:', () {
    testWidgets('Testing if ListView shows up', (tester) async {
      // Pumping the 'HomePage' widget
      await tester.pumpWidget(createHomeScreen());

      // Checking presence of the 'ListView'
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Testing Scrolling', (tester) async {
      // Pumping the 'HomePage' widget
      await tester.pumpWidget(createHomeScreen());

      // Checking presence of the 'Item 0' widget
      expect(find.text('Item 0'), findsOneWidget);

      // Scrolling to the bottom
      await tester.fling(
        find.byType(ListView),
        const Offset(0, -200),
        3000,
      );
      await tester.pumpAndSettle();

      // Checking absence of the 'Item 0' widget
      expect(find.text('Item 0'), findsNothing);
    });

    testWidgets('Testing IconButtons', (tester) async {
      // Pumping the 'HomePage' widget
      await tester.pumpWidget(createHomeScreen());

      // Checking absence of the 'Icons.favorite' widget
      expect(find.byIcon(Icons.favorite), findsNothing);

      // Tapping on first 'Icons.favorite_border' widget to add Favorite item
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Checking presence of the 'Added to favorites.' SnackBar's text
      expect(find.text('Added to favorites.'), findsOneWidget);

      // Checking presence of the 'Icons.favorite' widget
      expect(find.byIcon(Icons.favorite), findsWidgets);

      // Tapping on first 'Icons.favorite_border' widget to remove Favorite item
      await tester.tap(find.byIcon(Icons.favorite).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Checking presence of the 'Removed from favorites.' SnackBar's text
      expect(find.text('Removed from favorites.'), findsOneWidget);

      // Checking absence of the 'Icons.favorite' widget
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
  });
}
