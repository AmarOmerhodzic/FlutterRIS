import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences prefs;

  SharedPreferencesHelper({required this.prefs});
  Future<void> setExecuted() async {
    //await init();
    await prefs.setBool('executed', true);
  }

  bool? getExecuted() {
    final bool? executed = prefs.getBool('executed');
    return executed;
  }
}
