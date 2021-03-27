import 'package:flutter/material.dart';
import 'package:product_list/app/app.dart';
import 'package:get/get.dart';

/// The home view which will show the home screen and perform the basic
/// ui work.
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Scaffold(
          backgroundColor: Get.theme.backgroundColor,
        ),
      );
}
