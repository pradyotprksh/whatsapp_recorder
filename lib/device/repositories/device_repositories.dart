import 'dart:convert';

import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sencorder/app/app.dart';
import 'package:sencorder/device/device.dart';
import 'package:sencorder/domain/domain.dart';

/// Repositories that communicate with the platform e.g. GPS
class DeviceRepository extends DomainRepository {
  /// Initialize hive
  Future<void> init() async {
    var directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    final secureStorage = const FlutterSecureStorage();
    var containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }
    var encryptionKey = base64Url.decode(await secureStorage.read(key: 'key'));
    await Hive.openBox<dynamic>(StringConstants.appName,
        encryptionCipher: HiveAesCipher(encryptionKey));
  }

  /// Returns the box in which the data is stored.
  Box _getBox() => Hive.box<dynamic>(StringConstants.appName);

  @override
  String getStringValue(String key) {
    var box = _getBox();
    var value = box.get(key) as String;
    if (key == DeviceConstants.localLang) {
      value ??= DeviceConstants.defaultLang;
    }
    return value;
  }

  @override
  Future<bool> isAudioPermissionGranted() async =>
      await FlutterAudioRecorder.hasPermissions;

  @override
  List<dynamic> getListValue(String key) {
    var box = _getBox();
    var value = box.get(key) as List<dynamic>;
    value ??= <Map<String, String>>[];
    return value;
  }

  @override
  void saveValue(dynamic key, dynamic value) {
    _getBox().put(key, value);
  }
}
