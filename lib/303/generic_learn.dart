import 'package:equatable/equatable.dart';

class UserManagement<T extends AdminUser> {
  final T admin;
  final List<User> users;

  const UserManagement(this.admin, this.users);

  void sayName(User user) {
    print(user.name);
  }

  int calculateMoney(List<User> userList) {
    int initialValue = admin.role == 1 ? admin.money : 0;
    int sum = initialValue;

    for (User user in userList) {
      sum += user.money;
    }

    // High Order Functions
    final int sumMoney = userList.map((e) => e.money).fold<int>(
        initialValue, (previousValue, element) => previousValue + element);

    final int sumMoney2 = userList.fold<int>(initialValue,
        (previousValue, element) => previousValue + element.money);

    return sumMoney2;
  }

  Iterable<R>? showNames<R>() {
    if (R == String) {
      final Iterable<String> userNames = users.map((e) => e.name);
      return userNames.cast<R>();
    }
    return null;
  }
}

class User extends Equatable {
  const User(this.id, this.name, this.money);

  final int id;
  final String name;
  final int money;

  bool findUserName(String name) {
    return this.name == name;
  }

  @override
  String toString() => 'User(id: $id, name: $name, money: $money';
  
  @override
  List<Object?> get props => [id];
}

class AdminUser extends User {
  const AdminUser(super.id, super.name, super.money, this.role);

  final int role;
}
