import 'package:product_list/data/data.dart';
import 'package:product_list/device/device.dart';
import 'package:product_list/domain/domain.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository extends DomainRepository {
  /// [_deviceRepository] : the local repository.
  /// [_dataRepository] : the data repository like api and all.
  Repository(this._deviceRepository, this._dataRepository);

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

  @override
  String getStringValue(String key) => _deviceRepository.getStringValue(key);

  @override
  Future<CategoryList> getCatgories() {
    try {
      return _deviceRepository.getCatgories();
    } catch (_) {
      return _dataRepository.getCatgories();
    }
  }

  @override
  Future<Products> getProductList({String categoryId}) {
    try {
      return _deviceRepository.getProductList(categoryId: categoryId);
    } catch (_) {
      return _dataRepository.getProductList(categoryId: categoryId);
    }
  }
}
