import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comments_learn_view.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class ServiceGetLearnView extends StatefulWidget {
  const ServiceGetLearnView({Key? key}) : super(key: key);

  @override
  State<ServiceGetLearnView> createState() => _ServiceGetLearnViewState();
}

class _ServiceGetLearnViewState extends State<ServiceGetLearnView> {
  List<PostModel>? _posts;
  late final Dio _dio;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';
  bool _isLoading = false;

  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    fetchPostsAdvance();
  }

  void _setLoadingState() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPosts() async {
    _setLoadingState();
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == HttpStatus.ok) {
      final items = response.data;
      if (items is List) {
        setState(() {
          _posts = items.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _setLoadingState();
  }

  Future<void> fetchPostsAdvance() async {
    _setLoadingState();
    _posts = await _postService.fetchPostsAdvance();
    _setLoadingState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('data'),
          actions: [
            _isLoading
                ? const Center(child: CircularProgressIndicator.adaptive())
                : const SizedBox.shrink()
          ],
        ),
        body: ListView.builder(
          itemCount: _posts?.length ?? 0,
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
          itemBuilder: ((context, index) {
            return _PostCard(post: _posts?[index]);
          }),
        ));
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? post,
  })  : _post = post,
        super(key: key);

  final PostModel? _post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => CommentsLearnView(
                      postId: _post?.id,
                    ))));
          },
          title: Text(_post?.title ?? ''),
          subtitle: Text(_post?.body ?? ''),
        ),
      ),
    );
  }
}
