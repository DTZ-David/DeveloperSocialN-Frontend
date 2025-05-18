// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_refactor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentRefactorImpl _$$CommentRefactorImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentRefactorImpl(
      commentId: json['commentId'] as String,
      postId: json['postId'] as String,
      authorId: json['authorId'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      authorProfilePic: json['authorProfilePic'] as String,
      authorName: json['authorName'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
    );

Map<String, dynamic> _$$CommentRefactorImplToJson(
        _$CommentRefactorImpl instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'postId': instance.postId,
      'authorId': instance.authorId,
      'type': instance.type,
      'description': instance.description,
      'authorProfilePic': instance.authorProfilePic,
      'authorName': instance.authorName,
      'sentAt': instance.sentAt.toIso8601String(),
    };
