import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/shared_preference.dart';

final singleton = GetIt.instance;
Future<void> setup() async {
  final _prefs = await SharedPreferences.getInstance();
  singleton.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(prefs: _prefs),
  );

}

// Now you can retrieve SharedPreferencesHelper using GetIt
SharedPreferencesHelper sharedPreferencesHelper = singleton<SharedPreferencesHelper>();