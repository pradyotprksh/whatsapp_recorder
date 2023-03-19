import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
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
                        : Text(
                            StringConstants.messageHint,
                          ),
              ),
            ),
            Listener(
              onPointerMove: Get.find<HomeController>().cancelRecording,
              child: LongPressDraggable(
                axis: Axis.horizontal,
                feedback: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Get.theme.primaryColor,
                  child: Icon(
                    Icons.keyboard_voice_outlined,
                    color: Styles.iconThemeData.color,
                  ),
                ),
                childWhenDragging: Dimens.box0,
                onDragStarted: Get.find<HomeController>().startRecorder,
                onDragEnd: Get.find<HomeController>().endRecorder,
                child: IconButton(
                  onPressed: Get.find<HomeController>().checkForPermission,
                  icon: Icon(
                    Icons.keyboard_voice_outlined,
                    color: Styles.iconThemeData.color,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
