
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/call_back_learn.dart';
import 'package:flutter_full_learn/303/reqres_resource/core/extension/string_extension.dart';
import 'package:flutter_full_learn/303/reqres_resource/core/global/resource_context.dart';
import 'package:flutter_full_learn/303/reqres_resource/core/global/theme_notifier.dart';
import 'package:flutter_full_learn/303/reqres_resource/core/service/reqres_dio.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_manager.dart';
import 'package:flutter_full_learn/303/reqres_resource/view_model/reqres_provider.dart';
import 'package:provider/provider.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({Key? key}) : super(key: key);

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

// class _ReqresViewState extends ReqresViewModel {
class _ReqresViewState extends State<ReqresView> with ReqresDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (context) => ReqresProvider(ReqresManager(service)),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: context.watch<ReqresProvider>().isLoading ? const CircularProgressIndicator() : null,
            actions: [
              IconButton(onPressed: () {
                context.read<ReqresProvider>().saveToLocale(context.read<ResourceContext>());
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CallBackLearn(),));
              }, icon: const Icon(Icons.ac_unit))
            ],
          ),
          body: Column(
            children: [
              const _TempPlaceholder(),
              Expanded(child: _resourceListView(context, context.watch<ReqresProvider>().resources)),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            context.read<ThemeNotifier>().changeTheme();
          }),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> resources) {
    return ListView.builder(
          itemCount: context.watch<ReqresProvider>().resources.length,
          itemBuilder: (context, index) {
            return Card(
                color: Color(resources[index].color?.colorValue ?? 0),
                child: Text(resources[index].name ?? ''));
          },
        );
  }
}

class _TempPlaceholder extends StatelessWidget {
  const _TempPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ReqresProvider, bool>(builder: (context, value, child) {
      return value ? const Placeholder() : const Text('data');
    }, selector: (context, provider) {
      return provider.isLoading;
    });
  }
}
