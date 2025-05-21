// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentRequestImpl _$$CommentRequestImplFromJson(Map<String, dynamic> json) =>
    _$CommentRequestImpl(
      postId: json['postId'] as String,
      commentText: json['commentText'] as String,
      interactionType: (json['interactionType'] as num).toInt(),
    );

Map<String, dynamic> _$$CommentRequestImplToJson(
        _$CommentRequestImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'commentText': instance.commentText,
      'interactionType': instance.interactionType,
    };
