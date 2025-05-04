import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_request.freezed.dart';
part 'post_request.g.dart';

@freezed
class PostRequest with _$PostRequest {
  const factory PostRequest({
    required String codeSnippet,
    required String description,
    @Default([]) List<String> tags,
  }) = _PostRequest;

  factory PostRequest.fromJson(Map<String, dynamic> json) => _$PostRequestFromJson(json);
}
