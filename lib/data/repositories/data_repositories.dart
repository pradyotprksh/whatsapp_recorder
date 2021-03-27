import 'package:product_list/app/app.dart';
import 'package:product_list/data/data.dart';
import 'package:product_list/domain/domain.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  /// [_connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this._connectHelper);

  final ConnectHelper _connectHelper;

  @override
  String getStringValue(String key) {
    throw UnimplementedError();
  }

  @override
  Future<CategoryList> getCatgories() async {
    if (await Utility.isNetworkAvailable()) {
      var response = await _connectHelper.getCatgories();
      if (response.isOk) {
        var data = response.bodyString;
        return categoryListFromMap(data);
      } else {
        throw NetworkException(
          message: response.statusText,
          errorCode: response.statusCode,
        );
      }
    } else {
      throw NetworkException(
        message: StringConstants.noInternet,
        errorCode: 500,
      );
    }
  }

  @override
  Future<Products> getProductList({String categoryId}) async {
    if (await Utility.isNetworkAvailable()) {
      var response = await _connectHelper.getProducts(categoryId);
      if (response.isOk) {
        var data = response.bodyString;
        return productsFromMap(data);
      } else {
        throw NetworkException(
          message: response.statusText,
          errorCode: response.statusCode,
        );
      }
    } else {
      throw NetworkException(
        message: StringConstants.noInternet,
        errorCode: 500,
      );
    }
  }
}
