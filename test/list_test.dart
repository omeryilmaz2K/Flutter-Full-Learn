
import 'package:collection/collection.dart';
import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/303/list/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test(
    'Best of List',
    () {
      final List<User> users = [
        const User(1, 'Ömer', 100),
        const User(2, 'Mustafa', 100),
        const User(3, 'Vedat', 100),
      ];
      // users.add('value');

      List<HighCard> highCard = users.map((e) {
        return HighCard(items: e.name.split(' ').toList());
      }).toList();

      // users.singleWhere((element) => element.name == 'Ömer');
      try {
        final response = users.singleWhere((element) => element.findUserName('x'), orElse: () {
          return const User(0, 'name', 0);
        },);
        print(response.name);
      } catch (e) {
        print(e);
      }

      print('${users.where((element) => element.money > 500)}');

      users.addAll([const User(4, 'name', 100)]);
      // users.asMap();
      print(users.lastWhereOrNull((element) => element.id == 5));
      print(users.take(5));
      users.remove(const User(2, 'Vedat', 100));
      users.removeAt(1); // Error Expectation
      users.removeWhere((element) => element.id == 11);
      users.indexOf(const User(1, 'Ömer', 100));
      final result = users.indexWhere((element) => element.id == 11);
      if (result >= 0) {
        users[result] = User(result, 'name', 100);
      }

      users.map((e) => e.money).where((element) => element > 5).toList();
      // users.last; -> users.lastOrNull;
      users.forEachIndexed((index, element) {
        
      });
      // users.forEach((element) { });
      for (User user in users) {

      }
      users.expand((element) => [const User(0, 'name', 100)]);
      users.sample(3);
      print(users.contains(const User(1, 'Ömer', 100))); 
      users.any((element) => element.money > 5);
    },
  );

  test(
    'Best of List with Collection',
    () {
      final List<User> users = [
        const User(1, 'Ömer', 100),
        const User(2, 'Mustafa', 100),
        const User(3, 'Vedat', 100),
      ];
      // users.add('value');

      // users.singleWhere((element) => element.name == 'Ömer');
      // try {
      //   final response = users.singleWhere((element) => element.findUserName('x'), orElse: () {
      //     return const User(0, 'name', 0);
      //   },);
      //   print(response.name);
      // } catch (e) {
      //   print(e);
      // }

      final response = users.singleWhereOrNull((element) {
        return element.findUserName('x');
      },);
      print(response);
    },
  );
}
