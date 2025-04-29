import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String authorId,
    required String comment,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}
