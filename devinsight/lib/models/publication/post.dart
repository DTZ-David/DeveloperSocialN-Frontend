import 'package:freezed_annotation/freezed_annotation.dart';
import 'comment.dart';
import 'reaction.dart';

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
