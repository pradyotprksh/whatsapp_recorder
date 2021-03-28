import 'package:sencorder/domain/domain.dart';

/// Use case for getting the data from local database
class LocalUsecases {
  /// [_repository] : takes the repository to get the data
  LocalUsecases(this._repository);

  final Repository _repository;

  /// Get the string value for the [key].
  String getStringValue(String key) => _repository.getStringValue(key);

  /// Check if audio permission is granted or not
  Future<bool> isAudioPermissionGranted() async =>
      await _repository.isAudioPermissionGranted();

  /// Get data for the [key]
  List<dynamic> getListValue(String key) => _repository.getListValue(key);

  /// Save data for the [key]
  void saveValue(dynamic key, dynamic value) {
    _repository.saveValue(key, value);
  }
}
