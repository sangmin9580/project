import 'package:shared_preferences/shared_preferences.dart';

class InterestRepository {
  final SharedPreferences _sharedPreferences;

  InterestRepository(this._sharedPreferences);

  static const String _clickCount = "clickCount";
  static const List<String> interests = [];

  static String get clickCount => _clickCount;

  Future<void> setclickCount(int value) async {
    _sharedPreferences.setInt(_clickCount, value);
  }

  int getclickCount() {
    return _sharedPreferences.getInt(_clickCount) ?? 0;
  }

  Future<void> resetClickCount() async {
    await setclickCount(0);
  }
}
