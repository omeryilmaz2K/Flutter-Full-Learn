import 'package:flutter_full_learn/202/cache/shared_learn_view.dart';
import 'package:flutter_full_learn/303/reqres_resource/core/service/reqres_dio.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_manager.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/singleton/service/project_network_manager.dart';

abstract class ReqresViewModel extends LoadingStateful with ReqresDioMixin {
  @override
  void initState() {
    super.initState();
    reqresService = ReqresManager(ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeaderToToken('omer');
    _fetch();
  }

  late final ReqresService reqresService;
  List<Data> resources = [];

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}