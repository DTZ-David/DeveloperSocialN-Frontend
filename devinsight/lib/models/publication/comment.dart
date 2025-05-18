import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
      required String postId,
      required String authorId,
      required String interactionType,
      required String commentText,
      required String authorProfilePic,
      required String userName,
      required DateTime sentAt,
      required bool isOwnComment
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}
