import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_refactor.freezed.dart';
part 'post_refactor.g.dart';

@freezed
class PostRefactor with _$PostRefactor {
  const factory PostRefactor({
    required String postId,
    required String authorId,
    required String sentAt,
    required String profilePicture,
    required String authorUsername,
    required String description,
    required List<String> tags,
    required String codeSnippet,
    required String codeLanguage,
    required int shares,
    @Default({}) Map<String, int> reactionCounts,
  }) = _PostRefactor;

  factory PostRefactor.fromJson(Map<String, dynamic> json) =>
      _$PostRefactorFromJson(json);
}
