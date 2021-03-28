import 'package:sencorder/device/device.dart';

/// A chunk of shared preference keys which will
/// be used by [DeviceRepository] to get/save the data locally.
abstract class DeviceConstants {
  static const String localLang = 'localLang';
  static const String defaultLang = 'en';
  static const String savedRecording = 'savedRecording';
}
