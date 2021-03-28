import 'package:permission_handler/permission_handler.dart';

/// Handles all the permission used inside the application
abstract class PermissionHandler {
  /// Checks permission for speech permission
  static Future<bool> speachPermission() async {
    var status = await Permission.microphone.status;
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    } else {
      await Permission.microphone.request();
    }
    return false;
  }

  /// Checks permission for storage
  static Future<bool> storagePermission() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    } else {
      await Permission.storage.request();
    }
    return false;
  }

  /// Check permission if speech is allowed or not
  static Future<bool> isAllowedToRecord() async {
    var speech = await speachPermission();
    var storage = await storagePermission();
    return speech && storage;
  }
}
