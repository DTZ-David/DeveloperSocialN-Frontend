// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      fechaPublicacion: json['fechaPublicacion'] as String,
      codeLanguage: json['codeLanguage'] as String,
      codeSnippet: json['codeSnippet'] as String,
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
      'id': instance.id,
      'authorId': instance.authorId,
      'fechaPublicacion': instance.fechaPublicacion,
      'codeLanguage': instance.codeLanguage,
      'codeSnippet': instance.codeSnippet,
      'description': instance.description,
      'tags': instance.tags,
      'shares': instance.shares,
      'userName': instance.userName,
      'profilePicture': instance.profilePicture,
      'reactions': instance.reactions,
    };
