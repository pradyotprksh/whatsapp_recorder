import 'package:product_list/domain/domain.dart';

/// This will be talking to the other layers to retrieve the data.
class ProductsPresenter {
  ProductsPresenter(this._categoryUsecases);

  final CategoryUsecases _categoryUsecases;

  /// Get producst list
  Future<Products> getProductList(String categoryId) =>
      _categoryUsecases.getProductList(categoryId);
}
