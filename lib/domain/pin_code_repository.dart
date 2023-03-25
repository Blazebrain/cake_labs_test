import '../data/local_storage_service.dart';

class PinCodeRepository {
  final LocalStorageService _localStorageService;

  PinCodeRepository(this._localStorageService);

  Future<void> setPinCode(String pinCode) async {
    await _localStorageService.setPinCode(pinCode);
  }

  String? getPinCode() {
    return _localStorageService.getPinCode();
  }
}
