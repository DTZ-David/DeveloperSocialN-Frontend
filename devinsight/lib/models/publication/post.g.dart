// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      authorId: json['authorId'] as String,
      fechaPublicacion: json['fechaPublicacion'] as String,
      codeLanguage: json['codeLanguage'] as String,
      codeSnippet: json['codeSnippet'] as String,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      shares: (json['shares'] as num?)?.toInt() ?? 0,
      userName: json['userName'] as String,
      profilePicture: json['profilePicture'] as String,
      reactions: (json['reactions'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'authorId': instance.authorId,
      'fechaPublicacion': instance.fechaPublicacion,
      'codeLanguage': instance.codeLanguage,
      'codeSnippet': instance.codeSnippet,
      'comments': instance.comments,
      'description': instance.description,
      'tags': instance.tags,
      'shares': instance.shares,
      'userName': instance.userName,
      'profilePicture': instance.profilePicture,
      'reactions': instance.reactions,
    };
