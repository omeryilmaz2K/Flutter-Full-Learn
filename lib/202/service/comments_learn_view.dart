import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({Key? key, this.postId}) : super(key: key);
  final int? postId;

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostService _postService;
  List<CommentModel>? _comments;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    fetchCommentWithPostId();
  }

  void _setLoadingState() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchCommentWithPostId() async {
    _setLoadingState();
    _comments = await _postService.fetchCommentWithPostId(widget.postId ?? 0);
    _setLoadingState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink()
          ],
        ),
        body: ListView.builder(
          itemCount: _comments?.length ?? 0,
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          itemBuilder: ((context, index) {
            return Card(
              margin: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_comments?[index].name ?? ''),
                      Text(_comments?[index].email ?? ''),
                    ],
                  ),
                  subtitle: Text(_comments?[index].body ?? ''),
                ),
              ),
            );
          }),
        ));
  }
}
