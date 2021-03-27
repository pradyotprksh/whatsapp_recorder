import 'package:flutter/material.dart';
import 'package:sencorder/app/app.dart';

/// The message box widget which will be used by the user to send/record
/// message
class MessageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: ColorsValue.themeSecondColor(),
        padding: Dimens.edgeInsets5_5_5_5,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.emoji_emotions_outlined,
                color: Styles.iconThemeData.color,
              ),
              onPressed: () {},
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: StringConstants.messageHint,
                  hintStyle: Styles.oppositeNormal14,
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.keyboard_voice_outlined,
                color: Styles.iconThemeData.color,
              ),
              tooltip: StringConstants.vocieRecorder,
              onPressed: () {},
            ),
          ],
        ),
      );
}
