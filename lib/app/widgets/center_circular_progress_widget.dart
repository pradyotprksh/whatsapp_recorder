import 'package:flutter/material.dart';
import 'package:sencorder/app/app.dart';

/// A center progress bar indicator.
class CenterCircularProgressbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: WillPopScope(
          onWillPop: () async => false,
          child: Align(
            alignment: Alignment.center,
            child: Wrap(
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    ColorsValue.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
