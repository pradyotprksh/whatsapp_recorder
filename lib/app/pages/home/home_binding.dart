import 'package:product_list/app/app.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [HomeView].
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.put(
          HomePresenter(),
        ),
      ),
    );
  }
}
