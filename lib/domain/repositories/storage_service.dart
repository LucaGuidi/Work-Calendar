import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_calendar/core/constants/key_constants.dart';

@LazySingleton()
class StorageService {
  StorageService(this._storage);

  final SharedPreferences _storage;

  Future<void> storeNonWorkingDays(List<bool> nonWorkingDays) async {
    await _storage.setString(
      KeyConstants.nonWorkingDaysKey,
      jsonEncode(nonWorkingDays),
    );
  }

  List<bool> loadNonWorkingDays() {
    var nonWorkingDays = _storage.getString(KeyConstants.nonWorkingDaysKey);
    List<bool> loadedDays = [];
    (jsonDecode(nonWorkingDays ?? '[]') as List?)?.forEach((e) => loadedDays.add(e));
    return loadedDays;
  }
}
