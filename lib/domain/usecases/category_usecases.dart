import 'package:product_list/domain/domain.dart';

/// A photos use case which will help in doin all the business logic
/// related to photos.
class CategoryUsecases {
  CategoryUsecases(this._repository);

  final Repository _repository;

  /// Get category list
  Future<CategoryList> getCategoryList() => _repository.getCatgories();

  /// Get prodcut list
  Future<Products> getProductList(String categoryId) =>
      _repository.getProductList(categoryId: categoryId);
}
