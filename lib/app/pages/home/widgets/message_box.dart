import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:get/get.dart';
import 'package:sencorder/app/app.dart';

/// The message box widget which will be used by the user to send/record
/// message
class MessageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
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
              child: GetBuilder<HomeController>(
                builder: (_controller) =>
                    _controller.recordStatus == RecordingStatus.Recording
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_left_rounded,
                                color: Styles.iconThemeData.color,
                              ),
                              Text(
                                StringConstants.slideToCancel,
                              ),
                            ],
                          )
                        : TextFormField(
                            decoration: InputDecoration(
                              hintText: StringConstants.messageHint,
                              hintStyle: Styles.oppositeNormal14,
                              border: InputBorder.none,
                            ),
                          ),
              ),
            ),
            GestureDetector(
              onTap: Get.find<HomeController>().checkForPermission,
              onLongPress: Get.find<HomeController>().startRecorder,
              child: Padding(
                padding: Dimens.edgeInsets15_5_15_5,
                child: Icon(
                  Icons.keyboard_voice_outlined,
                  color: Styles.iconThemeData.color,
                ),
              ),
            ),
          ],
        ),
      );
}
