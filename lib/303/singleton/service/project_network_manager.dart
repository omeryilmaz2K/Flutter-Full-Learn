import 'package:dio/dio.dart';

// Lazy
class ProjectNetworkManager {
  ProjectNetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: 'pub.dev'));
  }

  static ProjectNetworkManager instance = ProjectNetworkManager._();
  late final Dio _dio;

  Dio get service => _dio;

  void addBaseHeaderToToken(String token) {
    _dio.options.copyWith(headers: {'Authorization': token});
  }
}

// Eager
class DurationManager {
  DurationManager._();

  static DurationManager? _manager;

  static DurationManager get manager {
    if (_manager != null) return _manager!;
    _manager = DurationManager._();
    return _manager!;
  }
}
