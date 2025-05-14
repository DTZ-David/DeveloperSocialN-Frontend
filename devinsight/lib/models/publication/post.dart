/*import 'reaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'comment.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String authorId,
    required String codeSnippet,
    required String description,
    required String userName,
    required String profilePicture,
    required int likes,
    required List<String> tags,
    @Default([]) List<Comment> comments,
    @Default([]) List<Reaction> reactions,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
*/

import 'package:devinsight/models/publication/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String authorId,
    required String fechaPublicacion,
    required String codeLanguage,
    required String codeSnippet,
    required List<Comment> comments,
    required String description,
    required List<String> tags,
    @Default(0) int shares, // Como no viene, le damos 0 por defecto
    required String userName,
    required String profilePicture,
    @Default({}) Map<String, int> reactions,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
