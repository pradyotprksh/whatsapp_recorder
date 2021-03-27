import 'package:sencorder/app/app.dart';
import 'package:get/get.dart';

/// The splash controller which will be used to control the [HomeView].
class HomeController extends GetxController {
  HomeController(this._homePresenter);

  final HomePresenter _homePresenter;

  @override
  void onInit() {
    _homePresenter.toString();
    super.onInit();
  }
}
