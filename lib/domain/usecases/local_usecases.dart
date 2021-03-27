import 'package:product_list/domain/domain.dart';

/// Use case for getting the data from local database
class LocalUsecases {
  /// [_repository] : takes the repository to get the data
  LocalUsecases(this._repository);

  final Repository _repository;

  /// Get the string value for the [key].
  String getStringValue(String key) => _repository.getStringValue(key);
}
