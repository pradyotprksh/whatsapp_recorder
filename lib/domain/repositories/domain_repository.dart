/// Abstract classes that define functionality for data and device layers
abstract class DomainRepository {
  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(String key);

  /// Save data for the [key]
  ///
  /// [key] : The key whose value needs to be saved.
  void saveValue(dynamic key, dynamic value);

  /// Get the list value for the [key].
  List<dynamic> getListValue(String key);

  /// Check if audio permission is granted or not
  Future<bool> isAudioPermissionGranted();
}
