import 'package:product_list/app/app.dart';
import 'package:get/get.dart';
import 'package:product_list/domain/domain.dart';

/// The splash controller which will be used to control the [HomeView].
class HomeController extends GetxController {
  HomeController(this._homePresenter);

  final HomePresenter _homePresenter;

  CategoryList categoryList;

  @override
  void onInit() {
    _callInitialApis();
    super.onInit();
  }

  /// Call initial apis
  void _callInitialApis() async {
    Utility.showLoadingDialog();
    await _getCategories();
    update();
    Utility.closeDialog();
  }

  Future<void> _getCategories() async {
    try {
      categoryList = await _homePresenter.getCategoryList();
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
