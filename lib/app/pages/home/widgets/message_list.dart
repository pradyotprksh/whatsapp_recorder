import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sencorder/app/app.dart';

/// Message list for the recordings
class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => ListView.builder(
          reverse: true,
          padding: EdgeInsets.zero,
          itemCount: _controller.savedRecordings?.length ?? 0,
          itemBuilder: (_, position) {
            var singleRecording = _controller.savedRecordings[position];
            return Container(
              margin: Dimens.edgeInsets60P_2_10_2,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Dimens.twenty,
                    ),
                    bottomLeft: Radius.circular(
                      Dimens.twenty,
                    ),
                    topRight: Radius.circular(
                      Dimens.twenty,
                    ),
                  ),
                ),
                color: ColorsValue.accentColor,
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {
                      _controller.playAudio(position);
                    },
                    icon: Icon(
                      singleRecording.isPlaying
                          ? Icons.stop
                          : Icons.play_arrow_outlined,
                      color: Styles.iconThemeData.color,
                    ),
                    color: Get.theme.primaryColor,
                  ),
                  title: Text(
                    singleRecording.isPlaying
                        ? StringConstants.stop
                        : StringConstants.play,
                    style: Styles.oppositeBoldl14,
                  ),
                  subtitle: Text(
                    '${singleRecording.recordingDuration} seconds',
                    style: Styles.oppositeNormal12,
                  ),
                ),
              ),
            );
          },
        ),
      );
}
