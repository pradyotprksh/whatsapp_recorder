import 'package:product_list/domain/domain.dart';

/// This will be talking to the other layers to retrieve the data.
class HomePresenter {
  HomePresenter(this._categoryUsecases);

  final CategoryUsecases _categoryUsecases;

  /// Get category list
  Future<CategoryList> getCategoryList() => _categoryUsecases.getCategoryList();
}
