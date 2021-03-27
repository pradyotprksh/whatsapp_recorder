import 'dart:io';

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
      if (_recorder == null) {
        await _initializedRecorder();
      }
      updateRecordingStatus(RecordingStatus.Recording);
    }
  }

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
}
