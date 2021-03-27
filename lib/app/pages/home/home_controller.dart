import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:sencorder/app/app.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

/// The splash controller which will be used to control the [HomeView].
class HomeController extends GetxController {
  HomeController(this._homePresenter);

  final HomePresenter _homePresenter;

  /// Recording details
  FlutterAudioRecorder _recorder;
  Recording _current;
  RecordingStatus recordStatus = RecordingStatus.Unset;

  /// Start the recorder
  void startRecorder() async {
    if (await _homePresenter.isAudioPermissionGranted()) {
      await _initializedRecorder();
      await _recorder.start();
      var recording = await _recorder.current(channel: 0);
      _current = recording;
      const tick = Duration(
        milliseconds: 50,
      );
      Timer.periodic(tick, (Timer t) async {
        if (recordStatus == RecordingStatus.Stopped) {
          t.cancel();
        }
        _current = await _recorder.current(channel: 0);
        recordStatus = _current.status;
        updateRecordingStatus(recordStatus);
      });
      updateRecordingStatus(RecordingStatus.Recording);
    }
  }

  /// Update the recording status with [currentStatus]
  void updateRecordingStatus(RecordingStatus currentStatus) {
    recordStatus = currentStatus;
    update();
  }

  /// Check for permission
  void checkForPermission() async =>
      await _homePresenter.isAudioPermissionGranted();

  /// Initializing the recorder if not initialzed
  Future<void> _initializedRecorder() async {
    var customPath = '/sencorder_';
    Directory appDocDirectory;
    if (GetPlatform.isIOS) {
      appDocDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocDirectory = await getExternalStorageDirectory();
    }
    customPath = appDocDirectory.path +
        customPath +
        DateTime.now().millisecondsSinceEpoch.toString();
    _recorder = FlutterAudioRecorder(customPath, audioFormat: AudioFormat.WAV);
    await _recorder.initialized;
    _current = await _recorder.current(channel: 0);
    Utility.printILog(_current.status.toString());
  }

  /// End the current recording. And if there is any recording then save it
  void endRecorder(DraggableDetails details) async {
    if (recordStatus == RecordingStatus.Recording) {
      var result = await _recorder.stop();
      Utility.printILog(result.duration.toString());
      Utility.printILog(result.path);
      updateRecordingStatus(RecordingStatus.Stopped);
    }
  }

  /// Cancel the recoring
  ///
  /// Need to handle swipe and cancel
  void cancelRecording(DragUpdateDetails details) {
    // if (details != null) {
    //   if (details.delta.dx > -0.42) {
    //     if (_recorder != null) {
    //       _recorder.stop();
    //     }
    //     updateRecordingStatus(RecordingStatus.Stopped);
    //   }
    // }
  }
}
