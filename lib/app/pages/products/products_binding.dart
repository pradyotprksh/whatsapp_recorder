import 'package:product_list/app/app.dart';
import 'package:get/get.dart';

/// A list of bindings which will be used in the route of [ProductsView].
class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(
      () => ProductsController(
        Get.put(
          ProductsPresenter(
            Get.find(),
          ),
        ),
      ),
    );
  }
}
