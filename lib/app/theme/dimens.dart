import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A dimension class which will contain all the dimensions
/// used all over the application.
abstract class Dimens {
  static const double zero = 0;
  static const double pointOne = 0.1;
  static const double one = 1;
  static const double two = 2;
  static const double three = 3;
  static const double four = 4;
  static const double five = 5;
  static const double six = 6;
  static const double seven = 7;
  static const double eight = 8;
  static const double nine = 9;
  static const double ten = 10;
  static const double twenty = 20;
  static const double thirty = 30;
  static const double fourty = 40;
  static const double fifty = 50;
  static const double sixty = 60;
  static const double seventy = 70;
  static const double eighty = 80;
  static const double ninty = 90;
  static const double hundred = 100;

  /// Get height percent [value].
  static double getHeightPercent(double value) => Get.height * value;

  /// Get width percent [value].
  static double getWidthPercent(double value) => Get.width * value;

  static const EdgeInsets edgeInsets15_15_15_15 = EdgeInsets.fromLTRB(
    Dimens.ten + Dimens.five,
    Dimens.ten + Dimens.five,
    Dimens.ten + Dimens.five,
    Dimens.ten + Dimens.five,
  );

  static const EdgeInsets edgeInsets20_15_20_80 = EdgeInsets.fromLTRB(
    Dimens.twenty,
    Dimens.ten + Dimens.five,
    Dimens.twenty,
    Dimens.eighty,
  );

  static const EdgeInsets edgeInsets15_15_15_0 = EdgeInsets.fromLTRB(
    Dimens.ten + Dimens.five,
    Dimens.ten + Dimens.five,
    Dimens.ten + Dimens.five,
    Dimens.zero,
  );

  static const EdgeInsets edgeInsets15_0_15_0 = EdgeInsets.fromLTRB(
    Dimens.ten + Dimens.five,
    Dimens.zero,
    Dimens.ten + Dimens.five,
    Dimens.zero,
  );

  static const EdgeInsets edgeInsets15_0_15_80 = EdgeInsets.fromLTRB(
    Dimens.ten + Dimens.five,
    Dimens.zero,
    Dimens.ten + Dimens.five,
    Dimens.eighty,
  );

  static const EdgeInsets edgeInsets0_15_0_15 = EdgeInsets.fromLTRB(
    Dimens.zero,
    Dimens.ten + Dimens.five,
    Dimens.zero,
    Dimens.ten + Dimens.five,
  );

  static const EdgeInsets edgeInsets30_10_30_10 = EdgeInsets.fromLTRB(
    Dimens.thirty,
    Dimens.ten,
    Dimens.thirty,
    Dimens.ten,
  );

  static const EdgeInsets edgeInsets5_5_5_5 = EdgeInsets.fromLTRB(
    Dimens.five,
    Dimens.five,
    Dimens.five,
    Dimens.five,
  );

  static const EdgeInsets edgeInsets5_0_5_0 = EdgeInsets.fromLTRB(
    Dimens.five,
    Dimens.zero,
    Dimens.five,
    Dimens.zero,
  );

  static const EdgeInsets edgeInsets15_15_15_80 = EdgeInsets.fromLTRB(
    Dimens.ten + Dimens.five,
    Dimens.ten + Dimens.five,
    Dimens.ten + Dimens.five,
    Dimens.eighty,
  );

  static const EdgeInsets edgeInsets0_0_0_80 = EdgeInsets.fromLTRB(
    Dimens.zero,
    Dimens.zero,
    Dimens.zero,
    Dimens.eighty,
  );

  static const EdgeInsets edgeInsets0_20_0_80 = EdgeInsets.fromLTRB(
    Dimens.zero,
    Dimens.twenty,
    Dimens.zero,
    Dimens.eighty,
  );

  static EdgeInsets edgeInsets15_45P_15_80 = EdgeInsets.fromLTRB(
    Dimens.ten + Dimens.five,
    getHeightPercent(0.45),
    Dimens.ten + Dimens.five,
    Dimens.eighty,
  );

  static EdgeInsets edgeInsets5_80P_5_0 = EdgeInsets.fromLTRB(
    Dimens.five,
    getHeightPercent(0.80),
    Dimens.five,
    Dimens.zero,
  );

  static const SizedBox boxWidth15 = SizedBox(
    width: Dimens.ten + Dimens.five,
  );

  static const SizedBox boxHeight15 = SizedBox(
    height: Dimens.ten + Dimens.five,
  );

  static const SizedBox boxHeight10 = SizedBox(
    height: Dimens.ten,
  );

  static const SizedBox box0 = SizedBox(
    height: Dimens.zero,
    width: Dimens.zero,
  );

  static const SizedBox boxHeight5 = SizedBox(height: Dimens.five);

  static const SizedBox boxWidth10 = SizedBox(
    width: Dimens.ten,
  );
}
