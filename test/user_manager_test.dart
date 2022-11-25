import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('User Calculate Test', () {
    final users = [
      const User(1, 'Ömer', 100),
      const User(2, 'Mustafa', 100),
      const User(3, 'Vedat', 100),
    ];

    final UserManagement userManagement =
        UserManagement(const AdminUser(1, 'Öadmin', 15, 1), users);

    final int result = userManagement.calculateMoney(users);

    final Iterable<String>? response = userManagement.showNames<String>();

    expect(result, 315);
  });
}
