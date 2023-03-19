import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sencorder/app/app.dart';
import 'package:sencorder/domain/domain.dart';

/// The splash controller which will be used to control the [HomeView].
class HomeController extends GetxController {
  HomeController(this._homePresenter);

  final HomePresenter _homePresenter;

  /// Recording details
  FlutterAudioRecorder2 _recorder;
  RecordingStatus recordStatus = RecordingStatus.Unset;

  /// List of recording
  List<Recordings> savedRecordings = <Recordings>[];

  AudioPlayer audioPlayer;

  @override
  void onInit() {
    _getListOfRecordings();
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerComplete.listen((event) {
      _pauseAllRecordings();
    });
    super.onInit();
  }

  /// Get the list of recordings
  void _getListOfRecordings() {
    var recordings = _homePresenter.getRecodingList();

    savedRecordings.clear();

    for (var recording in recordings) {
      if (recording is Map) {
        var path = recording.keys.first as String;
        var duration = recording.values.first as String;

        savedRecordings.add(
          Recordings(
            recordingPath: path,
            recordingDuration: duration,
            isPlaying: false,
          ),
        );
      }
    }

    update();
  }

  /// Start the recorder
  void startRecorder() async {
    if (await PermissionHandler.isAllowedToRecord()) {
      if (await _homePresenter.isAudioPermissionGranted()) {
        await _initializedRecorder();
        _pauseAllRecordings();
        await _recorder.start();
        updateRecordingStatus(RecordingStatus.Recording);
      }
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
    var recordingPath = '/sencorder_';
    Directory appDocDirectory;
    if (GetPlatform.isIOS) {
      appDocDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocDirectory = await getExternalStorageDirectory();
    }
    recordingPath = appDocDirectory.path +
        recordingPath +
        DateTime.now().millisecondsSinceEpoch.toString();
    _recorder = FlutterAudioRecorder2(
      recordingPath,
      audioFormat: AudioFormat.WAV,
    );
    await _recorder.initialized;
  }

  /// End the current recording. And if there is any recording then save it
  void endRecorder(DraggableDetails details) async {
    if (recordStatus == RecordingStatus.Recording) {
      var result = await _recorder.stop();
      var recordings = <dynamic>[];
      var saveRecordings = _homePresenter.getRecodingList() ?? recordings;
      recordings.addAll(saveRecordings);
      if (recordings != null) {
        recordings.add(
          <String, String>{
            result.path: result.duration.inSeconds.toString(),
          },
        );
        _homePresenter.saveRecordings(recordings);
      }
      updateRecordingStatus(RecordingStatus.Stopped);
      _getListOfRecordings();
    }
  }

  /// Cancel the recoring
  void cancelRecording(PointerMoveEvent event) async {
    if (event != null) {
      if (event.position.dx < (Get.size.width / 1.5)) {
        if (_recorder != null) {
          await _recorder.stop();
        }
        updateRecordingStatus(RecordingStatus.Stopped);
      }
    }
  }

  /// Play audio for the positioned recording
  void playAudio(int position) async {
    if (_isAnyAudioPlaying() == position) {
      _pauseAllRecordings();
    } else if (_isAnyAudioPlaying() != -1) {
      _pauseAllRecordings();
      _startPlaying(position);
    } else {
      _startPlaying(position);
    }
  }

  /// Checks if any audio is playing
  int _isAnyAudioPlaying() {
    for (var i = 0; i < savedRecordings.length; i++) {
      if (savedRecordings[i].isPlaying) {
        return i;
      }
    }
    return -1;
  }

  /// Pause all the recordings
  void _pauseAllRecordings() async {
    await audioPlayer.stop();
    for (var recording in savedRecordings) {
      if (recording.isPlaying) {
        recording.isPlaying = false;
      }
    }
    update();
  }

  /// Start playing
  void _startPlaying(int position) async {
    var recording = savedRecordings[position];
    if (recording != null) {
      await audioPlayer.play(
        AssetSource(
          recording.recordingPath,
        ),
      );
      savedRecordings[position].isPlaying = true;
      update();
    }
  }
}
