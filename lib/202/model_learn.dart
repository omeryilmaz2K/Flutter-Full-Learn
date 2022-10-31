class Post1 {
  int? userId;
  int? id;
  String? title;
  String? body;
}

class Post2 {
  Post2(this.userId, this.id, this.title, this.body);

  int userId;
  int id;
  String title;
  String body;
}

class Post3 {
  Post3(this.userId, this.id, this.title, this.body);

  final int userId;
  final int id;
  final String title;
  final String body;
}

class Post4 {
  Post4(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  final int userId;
  final int id;
  final String title;
  final String body;
}

class Post5 {
  Post5(
      {required int userId,
      required int id,
      required String title,
      required String body})
      : _userId = userId,
        _id = id,
        _title = title,
        _body = body;

  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  int get userId => _userId;
}

class Post6 {
  Post6(
      {required int userId,
      required int id,
      required String title,
      required String body}) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }

  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  int get userId => _userId;
}

class Post7 {
  Post7({int userId = 0, int id = 0, String title = '', String body = ''})
      : _userId = userId,
        _id = id,
        _title = title,
        _body = body;

  final int _userId;
  final int _id;
  final String _title;
  final String _body;
}

// Best for service
class Post8 {
  Post8({this.userId, this.id, this.title, this.body});

  Post8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Post8(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body);
  }

  final int? userId;
  final int? id;
  final String? title;
  String? body;

  void setBody(String? body) {
    // body.length; /// nullable
    if (body != null && body.isNotEmpty) {
      this.body = body;
    }
  }
}
