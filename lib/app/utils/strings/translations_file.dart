import 'package:get/get.dart';

/// The main translation file which will help
/// in localization of the application
///
/// [keys] : Contains all the language code which will be
/// used in the application
///
/// For more details on how to implement localization
/// can go to [GetX Internationalization](https://pub.dev/packages/get#internationalization)
/// and read there documentation.
class TranslationsFile extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'noInternet': 'You are not connected to the internet. Please check.',
          'okay': 'Okay',
          'somethingWentWrong': 'Oops! Something went wrong.',
          'home': 'Home',
          'order': 'Order',
          'cart': 'Cart',
          'profile': 'Profile',
          'addressExample': 'London se11 4hj, uk',
          'category': 'Category',
          'prodcuts': 'Prodcuts',
        },
      };
}
