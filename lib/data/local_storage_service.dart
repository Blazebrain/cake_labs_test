import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static const String _pinCodeBoxName = 'pin_code_box';
  static const String _pinCodeKeyName = 'pin_code';

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(_pinCodeBoxName);
  }

  Future<void> setPinCode(String pinCode) async {
    final box = Hive.box<String>(_pinCodeBoxName);
    await box.put(_pinCodeKeyName, pinCode);
  }

  String? getPinCode() {
    final box = Hive.box<String>(_pinCodeBoxName);
    return box.get(_pinCodeKeyName);
  }
}
