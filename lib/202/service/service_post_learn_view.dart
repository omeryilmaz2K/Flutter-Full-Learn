import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

class ServicePostLearnView extends StatefulWidget {
  const ServicePostLearnView({Key? key}) : super(key: key);

  @override
  State<ServicePostLearnView> createState() => _ServicePostLearnViewState();
}

class _ServicePostLearnViewState extends State<ServicePostLearnView> {
  late TextEditingController _titleController,
      _bodyController,
      _userIdController;
  late final Dio _dio;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';
  bool _isLoading = false;
  String? _title;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    _userIdController = TextEditingController();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _setLoadingState() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _postItem(PostModel postModel) async {
    _setLoadingState();
    final response = await _dio.post('posts', data: postModel);
    if (response.statusCode == HttpStatus.created) {
      _title = 'Başarılı';
    }
    _setLoadingState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title ?? ''),
        actions: [
          _isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox.shrink()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _inputText(
                userIdController: _titleController,
                inputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                text: 'Title'),
            _inputText(
                userIdController: _bodyController,
                inputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                text: 'Body'),
            _inputText(
                userIdController: _userIdController,
                inputType: TextInputType.number,
                textInputAction: TextInputAction.done,
                text: 'User Id'),
            ElevatedButton(
                onPressed: _isLoading ? null : _btnSend,
                child: const Text('Send'))
          ],
        ),
      ),
    );
  }

  void _btnSend() {
    if (_titleController.text.isNotEmpty &&
        _bodyController.text.isNotEmpty &&
        _userIdController.text.isNotEmpty) {
      final PostModel postModel = PostModel(
        title: _titleController.text,
        body: _bodyController.text,
        userId: int.tryParse(_userIdController.text),
      );
      _postItem(postModel);
    }
  }
}

class _inputText extends StatelessWidget {
  const _inputText({
    Key? key,
    required TextEditingController userIdController,
    required TextInputType inputType,
    required String text,
    required textInputAction,
  })  : userIdController = userIdController,
        inputType = inputType,
        textInputAction = textInputAction,
        text = text,
        super(key: key);

  final TextEditingController userIdController;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: userIdController,
      keyboardType: inputType,
      textInputAction: textInputAction,
      decoration:
          InputDecoration(border: const OutlineInputBorder(), labelText: text),
    );
  }
}
