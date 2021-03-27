import 'package:flutter/material.dart';
import 'package:sencorder/app/app.dart';
import 'package:get/get.dart';

/// The splash view which will show the splash screen and perform the basic
/// ui work.
class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<SplashController>(
        init: Get.find()..goToHome(),
        builder: (_controller) => Scaffold(
          backgroundColor: Get.theme.primaryColor,
          body: Center(
            child: Text(
              StringConstants.appName,
              style: Styles.bold30,
            ),
          ),
        ),
      );
}
