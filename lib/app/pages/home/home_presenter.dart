import 'package:sencorder/device/device_constants.dart';
import 'package:sencorder/domain/domain.dart';

/// This will be talking to the other layers to retrieve the data.
class HomePresenter {
  HomePresenter(this._localUsecases);

  final LocalUsecases _localUsecases;

  /// Check if audio permission is granted or not
  Future<bool> isAudioPermissionGranted() async =>
      await _localUsecases.isAudioPermissionGranted();

  /// Get saved recordings
  List<dynamic> getRecodingList() =>
      _localUsecases.getListValue(DeviceConstants.savedRecording);

  /// Save the new list of recordings
  void saveRecordings(dynamic value) {
    _localUsecases.saveValue(DeviceConstants.savedRecording, value);
  }
}
