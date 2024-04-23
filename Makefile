# Link: https://iametornam.hashnode.dev/how-to-clean-the-ios-and-android-folders-of-a-flutter-project-with-a-makefile

clean:
	flutter clean
	flutter pub get

# Runs all Unit tests 
unit-test:
	flutter test test/models/favorites_test.dart --reporter=expanded

# Runs all Widget tests from 'home_test.dart' in HEADLESS mode
widget-home:
	flutter test test/home_test.dart --reporter=expanded

# Runs all Widget tests from 'home_test.dart' on Emulator/Simulator or Real Device
widget-home-emu:
	flutter run test/home_test.dart 

# Runs all Widget tests from 'favorites_test.dart' in HEADLESS mode
widget-favorites:
	flutter test test/favorites_test.dart --reporter=expanded

# Runs all Widget tests from 'favorites_test.dart' on Emulator/Simulator or Real Device
widget-favorites-emu:
	flutter run test/favorites_test.dart 

# Runs all Integration tests from 'app_test.dart' on Emulator/Simulator or Real Device
int-test:
	flutter test integration_test/app_test.dart --reporter=expanded

# Runs Scroll Performance test from 'perf_test.dart' on Emulator/Simulator or Real Device
perf-scroll:
	flutter drive \
 		--driver=test_driver/perf_driver.dart \
  		--target=integration_test/perf_test.dart \
  		--profile \
  		--no-dds
