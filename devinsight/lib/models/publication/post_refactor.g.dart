// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_refactor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostRefactorImpl _$$PostRefactorImplFromJson(Map<String, dynamic> json) =>
    _$PostRefactorImpl(
      postId: (json['postId'] as num).toInt(),
      authorId: (json['authorId'] as num).toInt(),
      sentAt: json['sentAt'] as String,
      profilePicture: json['profilePicture'] as String,
      authorUsername: json['authorUsername'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      codeSnippet: json['codeSnippet'] as String,
      shares: (json['shares'] as num).toInt(),
      reactionCounts: (json['reactionCounts'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$PostRefactorImplToJson(_$PostRefactorImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'authorId': instance.authorId,
      'sentAt': instance.sentAt,
      'profilePicture': instance.profilePicture,
      'authorUsername': instance.authorUsername,
      'description': instance.description,
      'tags': instance.tags,
      'codeSnippet': instance.codeSnippet,
      'shares': instance.shares,
      'reactionCounts': instance.reactionCounts,
    };
