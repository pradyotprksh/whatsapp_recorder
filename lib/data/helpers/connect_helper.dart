import 'package:get/get.dart';
import 'package:product_list/data/data.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper extends GetConnect {
  @override
  void onInit() {
    httpClient
      ..baseUrl = DataConstants.baseUrl
      ..timeout = const Duration(
        milliseconds: 500,
      )
      ..maxAuthRetries = 2
      ..maxRedirects = 2;
    super.onInit();
  }

  // Get list of categories
  Future<Response<String>> getCatgories() => get(
        'get_categories',
      );

  // Get list of products
  Future<Response<String>> getProducts(String categoryId) {
    var body = <String, String>{};
    body['key'] = 'category';
    body['value'] = categoryId;
    return post(
      'get_products',
      FormData(body),
    );
  }
}
