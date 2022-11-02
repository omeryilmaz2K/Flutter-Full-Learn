import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> postItem(PostModel postModel);
  Future<bool> putItem(PostModel postModel, int id);
  Future<bool> deleteItem(PostModel postModel, int id);
  Future<List<PostModel>?> fetchPostsAdvance();
  Future<List<CommentModel>?> fetchCommentWithPostId(int postId);
}

class PostService implements IPostService {
  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
  final Dio _dio;

  @override
  Future<bool> postItem(PostModel postModel) async {
    try {
      final response =
          await _dio.post(_PostServicePaths.posts.name, data: postModel);
      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowError.showError(error, this);
    }
    return false;
  }

  @override
  Future<bool> putItem(PostModel postModel, int id) async {
    try {
      final response = await _dio.put('${_PostServicePaths.posts.name}/$id',
          data: postModel);
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowError.showError(error, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItem(PostModel postModel, int id) async {
    try {
      final response = await _dio.delete('${_PostServicePaths.posts.name}/$id');
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowError.showError(error, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostsAdvance() async {
    try {
      final response = await _dio.get('posts');
      if (response.statusCode == HttpStatus.ok) {
        final items = response.data;
        if (items is List) {
          return items.map((e) => PostModel.fromJson(e)).toList();
        }
      }
      return null;
    } on DioError catch (error) {
      _ShowError.showError(error, this);
    }
    return null;
  }
  
  @override
  Future<List<CommentModel>?> fetchCommentWithPostId(int postId) async {
    try {
      final response = await _dio.get(_PostServicePaths.comments.name, 
      queryParameters: {_PostQueryPaths.postId.name : postId}
      );
      if (response.statusCode == HttpStatus.ok) {
        final items = response.data;
        if (items is List) {
          return items.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
      return null;
    } on DioError catch (error) {
      _ShowError.showError(error, this);
    }
    return null;
  }
}

enum _PostServicePaths { posts, comments }
enum _PostQueryPaths { postId }

class _ShowError {
  static void showError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
    }
  }
}
