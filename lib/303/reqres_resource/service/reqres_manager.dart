import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';

class ReqresManager extends ReqresService {
  ReqresManager(Dio dio) : super(dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get('/unknown');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
