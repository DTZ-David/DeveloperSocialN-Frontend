import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Comment {
  final String commentId;
  final String publicacionId;
  final String authorId;
  final String authorName;
  final String authorProfilePic;
  final String type;
  final String value;

  Comment({
    required this.commentId,
    required this.publicacionId,
    required this.authorId,
    required this.authorName,
    required this.authorProfilePic,
    required this.type,
    required this.value,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        commentId: json['commentId'],
        publicacionId: json['publicacionId'],
        authorId: json['authorId'],
        authorName: json['authorName'],
        authorProfilePic: json['authorProfilePic'],
        type: json['type'],
        value: json['value'],
      );
}

/// Provider de tipo future para cargar todos los comentarios
final commentsProvider = FutureProvider<List<Comment>>((ref) async {
  final data = await rootBundle.loadString('assets/data/comments.json');
  final List<dynamic> jsonData = json.decode(data);
  return jsonData.map((e) => Comment.fromJson(e)).toList();
});

/// Provider que recibe un publicacionId y filtra los comentarios
final commentsByPublicationProvider =
    Provider.family<List<Comment>, String>((ref, publicacionId) {
  final commentsAsync = ref.watch(commentsProvider);

  return commentsAsync.maybeWhen(
    data: (comments) =>
        comments.where((c) => c.publicacionId == publicacionId).toList(),
    orElse: () => [],
  );
});
