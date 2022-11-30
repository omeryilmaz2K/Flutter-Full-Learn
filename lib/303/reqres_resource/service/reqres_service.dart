import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';

abstract class ReqresService {
  const ReqresService(this.dio);

  final Dio dio;

  Future<ResourceModel?> fetchResourceItem();
}