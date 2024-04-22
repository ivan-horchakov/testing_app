import 'package:test/test.dart';
import 'package:testing_app/models/favorites.dart';

// make unit-test

void main() {
  group('App Provider UNIT TESTS:', () {
    var favorites = Favorites();

    test('A new item should be added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      expect(favorites.items.first, number);
    });

    test('An item should be removed', () {
      var number = 45;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      expect(favorites.items.last, number);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
