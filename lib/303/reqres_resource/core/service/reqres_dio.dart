import 'package:dio/dio.dart';

mixin ReqresDioMixin {
  final service = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
}