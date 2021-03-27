import 'package:product_list/app/app.dart';
import 'package:get/get.dart';
import 'package:product_list/domain/domain.dart';

/// The Products controller which will be used to control the [ProductsView].
class ProductsController extends GetxController {
  ProductsController(this._productsPresenter);

  final ProductsPresenter _productsPresenter;

  CategoryList categoryList;
  Products productList;

  /// Get category length
  int getTabLength() {
    categoryList = Get.find<HomeController>().categoryList;
    return categoryList?.data?.length ?? 0;
  }

  /// Get initial index
  int getInitialIndex() {
    var currentIndex = 0;
    categoryList ??= Get.find<HomeController>().categoryList;
    var categoryId =
        (Get.arguments as Map<String, dynamic>)['categoryId'] as String;
    if (categoryId != null) {
      var index = categoryList.data.indexOf(
        Datum(categoryId: categoryId),
      );
      if (index > 0) currentIndex = index;
    }
    getProductList(categoryId);
    return currentIndex;
  }

  /// Get product list for the [catgeoryId]
  void getProductList(String catgeoryId) async {
    productList = null;
    update();
    Utility.showLoadingDialog();
    try {
      productList = await _productsPresenter.getProductList(catgeoryId);
      Utility.closeDialog();
      update();
    } on NetworkException catch (exception) {
      Utility.closeDialog();
      Utility.showMessage(
        exception.toString(),
        MessageType.error,
        null,
        StringConstants.okay,
      );
    } catch (exception) {
      Utility.closeDialog();
      Utility.showMessage(
        exception.toString(),
        MessageType.error,
        null,
        StringConstants.okay,
      );
    }
  }
}
