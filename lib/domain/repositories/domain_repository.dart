/// Abstract classes that define functionality for data and device layers
abstract class DomainRepository {
  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(String key);

  /// Check if audio permission is granted or not
  Future<bool> isAudioPermissionGranted();
}
