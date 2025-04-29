// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      authorId: json['authorId'] as String,
      codeSnippet: json['codeSnippet'] as String,
      description: json['description'] as String,
      userName: json['userName'] as String,
      profilePicture: json['profilePicture'] as String,
      likes: (json['likes'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) => Reaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'authorId': instance.authorId,
      'codeSnippet': instance.codeSnippet,
      'description': instance.description,
      'userName': instance.userName,
      'profilePicture': instance.profilePicture,
      'likes': instance.likes,
      'tags': instance.tags,
      'comments': instance.comments,
      'reactions': instance.reactions,
    };
