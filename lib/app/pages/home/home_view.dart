import 'package:flutter/material.dart';
import 'package:sencorder/app/app.dart';
import 'package:get/get.dart';

/// The home view which will show the home screen and perform the basic
/// ui work.
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: MessageList(),
            ),
            MessageBox(),
          ],
        ),
      );
}
