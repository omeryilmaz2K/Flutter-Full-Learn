import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/cache_list/user_cache_manager.dart';
import 'package:flutter_full_learn/202/cache/cache_list/user_model.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({Key? key}) : super(key: key);

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends State<SharedListCache> {
  List<UserModel> userList = [];
  late final UserCacheManager cacheManager;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final sharedManager = SharedManager();
    await sharedManager.init();
    cacheManager = UserCacheManager(sharedManager: sharedManager);
    userList = cacheManager.getItems() ?? UserUtils.getDummyUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await cacheManager.saveItems(userList);
              },
              icon: const Icon(Icons.save_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline)),
        ],
      ),
      body: _UserListView(userList: userList),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({
    Key? key,
    required this.userList,
  }) : super(key: key);

  final List<UserModel> userList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(userList[index].name ?? ''),
            subtitle: Text(userList[index].description ?? ''),
            trailing: TextButton(
              onPressed: () {
                final Uri uri = Uri.parse(userList[index].url ?? '');
                launchUrl(uri);
              },
              child: Text(
                userList[index].url ?? '',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        );
      },
    );
  }
}
