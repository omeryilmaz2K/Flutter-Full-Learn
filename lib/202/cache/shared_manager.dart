import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedPreferences? preferences;

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringList(SharedKeys key, List<String> valueList) async {
    await preferences?.setStringList(key.name, valueList);
  }

  Future<bool?> remove(SharedKeys key) async {
    return await preferences?.remove(key.name);
  }

  String? getString(SharedKeys key) {
    return preferences?.getString(key.name);
  }
  
  List<String>? getStringList(SharedKeys key) {
    return preferences?.getStringList(key.name);
  }
}

enum SharedKeys { title, users }
