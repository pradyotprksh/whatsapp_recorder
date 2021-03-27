import 'package:product_list/domain/domain.dart';

/// Abstract classes that define functionality for data and device layers
abstract class DomainRepository {
  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(String key);

  // Get list of categories
  Future<CategoryList> getCatgories();

  /// Get product list for the [categoryId].
  Future<Products> getProductList({String categoryId});
}
