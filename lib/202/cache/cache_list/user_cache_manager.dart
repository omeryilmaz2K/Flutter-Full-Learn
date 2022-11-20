import 'dart:convert';

import 'package:flutter_full_learn/202/cache/cache_list/user_model.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';

class UserCacheManager {
  UserCacheManager({required this.sharedManager});
  late final SharedManager sharedManager;

  Future<void> saveItems(List<UserModel> userList) async {
    final List<String> items =
        userList.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringList(SharedKeys.users, items);
  }

  List<UserModel>? getItems() {
    final List<String>? items = sharedManager.getStringList(SharedKeys.users);
    if (items?.isNotEmpty ?? false) {
      return items!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return UserModel.fromJson(json);
        }
        return UserModel(name: '', description: '', url: '');
      }).toList();
    }
    return null;
  }
}
