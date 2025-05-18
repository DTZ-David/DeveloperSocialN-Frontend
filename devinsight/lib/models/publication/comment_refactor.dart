import 'package:freezed_annotation/freezed_annotation.dart';
part 'comment_refactor.freezed.dart';
part 'comment_refactor.g.dart';

@freezed
class CommentRefactor with _$CommentRefactor {
  const factory CommentRefactor({
    required String commentId,
    required String postId,
    required String authorId,
    required String type,
    required String description,
    required String authorProfilePic,
    required String authorName,
    required DateTime sentAt,
  }) = _CommentRefactor;

  factory CommentRefactor.fromJson(Map<String, dynamic> json) =>
      _$CommentRefactorFromJson(json);
}
