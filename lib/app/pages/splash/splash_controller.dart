import 'package:sencorder/app/app.dart';
import 'package:get/get.dart';

/// The splash controller which will be used to control the [SplashView].
class SplashController extends GetxController {
  /// Go to home screen after 2 seconds
  void goToHome() {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      RouteManagement.goToHome,
    );
  }
}
