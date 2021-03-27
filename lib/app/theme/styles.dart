import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_list/app/app.dart';

/// A list of styles used all over the application.
abstract class Styles {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    backgroundColor: Colors.white,
    fontFamily: GoogleFonts.muli().fontFamily,
    primaryColor: ColorsValue.primaryColor,
    primarySwatch: const MaterialColor(
      ColorsValue.primaryColorHex,
      ColorsValue.primaryColorSwatch,
    ),
    accentColor: ColorsValue.accentColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: elevatedButtonStyle,
    textButtonTheme: textButtonStyle,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.light,
    backgroundColor: ColorsValue.darkBackgroundColor,
    fontFamily: GoogleFonts.muli().fontFamily,
    primaryColor: ColorsValue.primaryColor,
    primarySwatch: const MaterialColor(
      ColorsValue.primaryColorHex,
      ColorsValue.primaryColorSwatch,
    ),
    accentColor: ColorsValue.accentColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: elevatedButtonStyle,
    textButtonTheme: textButtonStyle,
  );

  static TextStyle white15 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.five,
    color: Colors.white,
  );

  static TextStyle white14 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.four,
    color: Colors.white,
  );

  static TextStyle normal16 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.six,
    color: ColorsValue.themeOppositeColor(),
  );

  static TextStyle normal12 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.two,
    color: ColorsValue.themeColor(),
  );

  static TextStyle normal14 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.four,
    color: ColorsValue.themeColor(),
  );

  static TextStyle oppositeNormal14 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.four,
    color: ColorsValue.themeOppositeColor(),
  );

  static TextStyle normal18 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.eight,
    color: ColorsValue.themeColor(),
  );

  static TextStyle boldl18 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.eight,
    fontWeight: FontWeight.bold,
    color: ColorsValue.themeColor(),
  );

  static TextStyle boldl14 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.four,
    fontWeight: FontWeight.bold,
    color: ColorsValue.themeColor(),
  );

  static TextStyle oppositeBoldl18 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.eight,
    fontWeight: FontWeight.bold,
    color: ColorsValue.themeOppositeColor(),
  );

  static TextStyle oppositeBoldl14 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.four,
    fontWeight: FontWeight.bold,
    color: ColorsValue.themeOppositeColor(),
  );

  static TextStyle oppositeBoldl12 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.two,
    fontWeight: FontWeight.bold,
    color: ColorsValue.themeOppositeColor(),
  );

  static TextStyle subtitlel14 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.four,
    fontWeight: FontWeight.bold,
    color: ColorsValue.subtitleColor,
  );

  static TextStyle accentBold14 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.four,
    fontWeight: FontWeight.bold,
    color: ColorsValue.accentColor,
  );

  static TextStyle subtitlel10 = GoogleFonts.muli(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.bold,
    color: ColorsValue.subtitleColor,
  );

  static TextStyle bold30 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.twenty,
    fontWeight: FontWeight.bold,
    color: ColorsValue.themeColor(),
  );

  static TextStyle primaryBold20 = GoogleFonts.muli(
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.bold,
    color: ColorsValue.primaryColor,
  );

  static TextStyle whiteBold30 = GoogleFonts.muli(
    fontSize: Dimens.ten + Dimens.twenty,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static ElevatedButtonThemeData elevatedButtonStyle = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: ColorsValue.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimens.thirty,
        ),
      ),
      padding: Dimens.edgeInsets15_15_15_15,
    ),
  );

  static TextButtonThemeData textButtonStyle = TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.transparent,
      elevation: Dimens.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimens.thirty,
        ),
      ),
    ),
  );

  static IconThemeData iconThemeData = IconThemeData(
    color: Get.isDarkMode ? Colors.white : ColorsValue.darkBackgroundColor,
  );
}
