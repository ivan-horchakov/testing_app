import 'package:flutter_test/flutter_test.dart';

Future<void> pumpUntilFound(
  WidgetTester tester,
  Finder finder, {
  int iterations = 100,
}) async {
  for (int i = 1; i <= iterations; i++) {
    final found = tester.any(finder);
    if (!found) {
      await tester.pump(const Duration(milliseconds: 100));
      if (i == iterations) {
        print('NOT FOUND => $finder (after max.$i iterations)');
      }
    } else {
      break;
    }
  }
}

Future<void> pumpUntilNotFound(
  WidgetTester tester,
  Finder finder, {
  int iterations = 50,
}) async {
  for (int i = 1; i <= iterations; i++) {
    final found = tester.any(finder);
    if (found) {
      await tester.pump(const Duration(milliseconds: 100));
      if (i == iterations) {
        print('STILL FINDING => $finder (after max.$i iterations)');
      }
    } else {
      break;
    }
  }
}
