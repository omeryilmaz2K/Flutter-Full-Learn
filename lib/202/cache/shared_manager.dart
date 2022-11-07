import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedPreferences? preferences;

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> save(SharedKeys key, String value) async {
    await preferences?.setString(key.name, value);
  }

  Future<bool?> remove(SharedKeys key) async {
    return await preferences?.remove(key.name);
  }

  String? get(SharedKeys key) {
    return preferences?.getString(key.name);
  }
}

enum SharedKeys {
  title
}