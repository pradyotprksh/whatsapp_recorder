import 'package:sencorder/app/app.dart';
import 'package:get/get.dart';

/// A chunk of routes taken in the application.
abstract class RouteManagement {
  /// Go to the splash screen.
  static void goToSplash() {
    Get.offNamed<void>(
      Routes.splashScreen,
    );
  }

  /// Go to the home screen.
  static void goToHome() {
    Get.offNamed<void>(
      Routes.homeScreen,
    );
  }
}
