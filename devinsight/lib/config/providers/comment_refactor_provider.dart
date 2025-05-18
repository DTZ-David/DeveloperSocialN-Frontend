import 'dart:convert';
import 'package:devinsight/models/publication/comment_refactor.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentRefactorProvider =
    FutureProvider<List<CommentRefactor>>((ref) async {
  final String jsonString =
      await rootBundle.loadString('assets/data/comments.json');
  final List<dynamic> jsonList = json.decode(jsonString);
  return jsonList
      .map((jsonItem) =>
          CommentRefactor.fromJson(jsonItem as Map<String, dynamic>))
      .toList();
});
