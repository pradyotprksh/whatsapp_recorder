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
          'okay': 'Okay',
          'somethingWentWrong': 'Oops! Something went wrong.',
          'vocieRecorder': 'Send a recorded message',
          'messageHint': 'Message',
        },
      };
}
