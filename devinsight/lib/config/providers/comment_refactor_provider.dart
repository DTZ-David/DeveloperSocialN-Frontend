import 'dart:convert';
import 'package:devinsight/models/publication/comment.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentProvider = FutureProvider<List<Comment>>((ref) async {
  final String jsonString =
      await rootBundle.loadString('assets/data/comments.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList
      .map((jsonItem) => Comment.fromJson(jsonItem as Map<String, dynamic>))
      .toList();
});

// Provider to filter comments by postId
final commentsByPostIdProvider =
    FutureProvider.family<List<Comment>, String>((ref, postId) async {
  final comments = await ref.watch(commentProvider.future);
  final filteredComments =
      comments.where((comment) => comment.postId == postId).toList();
  return filteredComments;
});
