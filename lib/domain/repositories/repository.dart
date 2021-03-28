import 'package:sencorder/device/device.dart';
import 'package:sencorder/domain/domain.dart';

/// The main repository which will get the data from [DeviceRepository].
class Repository extends DomainRepository {
  /// [_deviceRepository] : the local repository.
  Repository(this._deviceRepository);

  final DeviceRepository _deviceRepository;

  @override
  String getStringValue(String key) => _deviceRepository.getStringValue(key);

  @override
  Future<bool> isAudioPermissionGranted() async =>
      await _deviceRepository.isAudioPermissionGranted();

  @override
  List<dynamic> getListValue(String key) => _deviceRepository.getListValue(key);

  @override
  void saveValue(dynamic key, dynamic value) {
    _deviceRepository.saveValue(key, value);
  }
}
