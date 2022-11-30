import 'package:flutter/cupertino.dart';
import 'package:flutter_full_learn/303/reqres_resource/core/global/resource_context.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';

class ReqresProvider extends ChangeNotifier {
  ReqresProvider(this.reqresService) {
    _fetch();
  }

  final ReqresService reqresService;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}