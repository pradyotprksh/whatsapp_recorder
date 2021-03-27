part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const splashScreen = _Paths.splashScreen;
  static const homeScreen = _Paths.homeScreen;
}

abstract class _Paths {
  static const splashScreen = '/splash-screen';
  static const homeScreen = '/home-screen';
}
