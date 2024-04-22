import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_app/main.dart';

import 'pages/home_pom.dart';

void main() {
  // Scroll Performance Test:
  // make perf_scroll

  group('PERFORMANCE TESTING:', () {
    // The ensureInitialized() function verifies if the integration test driver is initialized,
    // reinitializing it if required.
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    // Setting framePolicy to fullyLive is good for testing animated code.
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Scrolling test', (tester) async {
      // Pumping the 'TestingApp' application
      await tester.pumpWidget(const TestingApp());

      // The traceAction() function records the actions and generates a timeline summary
      await binding.traceAction(
        () async {
          // Bottom Scrolling
          await tester.fling(HomePagePOM.listViewByTypeFinder, const Offset(0, -500), 10000);
          await tester.pumpAndSettle();

          // Up Scrolling
          await tester.fling(HomePagePOM.listViewByTypeFinder, const Offset(0, 500), 10000);
          await tester.pumpAndSettle();
        },
        reportKey: 'scrolling_summary',
      );
      /*
      After the test completes successfully, the build directory at the root of the project contains two files:
        1. 'scrolling_summary.timeline_summary.json' contains the summary. 
        2. 'scrolling_summary.timeline.json' contains the complete timeline data.
      Open the file(s) with any text editor to review the information contained within.
      */
    });
  });
}
