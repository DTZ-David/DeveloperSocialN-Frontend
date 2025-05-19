// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      postId: json['postId'] as String,
      authorId: json['authorId'] as String,
      interactionType: json['interactionType'] as String,
      commentText: json['commentText'] as String,
      authorProfilePic: json['authorProfilePic'] as String,
      userName: json['userName'] as String,
      sentAt:
          const CustomDateTimeConverter().fromJson(json['sentAt'] as String),
      isOwnComment: json['isOwnComment'] as bool,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'authorId': instance.authorId,
      'interactionType': instance.interactionType,
      'commentText': instance.commentText,
      'authorProfilePic': instance.authorProfilePic,
      'userName': instance.userName,
      'sentAt': const CustomDateTimeConverter().toJson(instance.sentAt),
      'isOwnComment': instance.isOwnComment,
    };
