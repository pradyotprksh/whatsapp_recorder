import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A list of custom color used in the application.
abstract class ColorsValue {
  static const Map<int, Color> primaryColorSwatch = {
    50: Color.fromRGBO(108, 80, 221, .1),
    100: Color.fromRGBO(108, 80, 221, .2),
    200: Color.fromRGBO(108, 80, 221, .3),
    300: Color.fromRGBO(108, 80, 221, .4),
    400: Color.fromRGBO(108, 80, 221, .5),
    500: Color.fromRGBO(108, 80, 221, .6),
    600: Color.fromRGBO(108, 80, 221, .7),
    700: Color.fromRGBO(108, 80, 221, .8),
    800: Color.fromRGBO(108, 80, 221, .9),
    900: Color.fromRGBO(108, 80, 221, .10),
  };

  static const Color primaryColor = Color(
    primaryColorHex,
  );

  static const Color accentColor = Color(
    accentColorHex,
  );

  static const Color darkBackgroundColor = Color(darkBackgroundColorHex);

  static const Color darkSecondColor = Color(darkSecondColorHex);

  static const Color subtitleColor = Color(subtitleColorHex);

  static const int primaryColorHex = 0xFF6C50DD;

  static const int accentColorHex = 0xFF4121CA;

  static const int darkSecondColorHex = 0xFF2D2D2D;

  static const int darkBackgroundColorHex = 0xFF181818;

  static const int subtitleColorHex = 0xFFC1C1C1;

  static Color themeOppositeColor() =>
      Get.isDarkMode ? Colors.white : darkBackgroundColor;

  static Color themeColor() =>
      Get.isDarkMode ? darkBackgroundColor : Colors.white;

  static Color themeSecondColor() =>
      Get.isDarkMode ? darkSecondColor : Colors.white;
}
