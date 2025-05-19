// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
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
    @CustomDateTimeConverter() required DateTime sentAt, // 👈 Aplica el conversor
    required bool isOwnComment,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String date) {
    return DateFormat("d/M/yyyy H:m:s").parse(date);
  }

  @override
  String toJson(DateTime date) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss").format(date); // ISO para enviar
  }
}
