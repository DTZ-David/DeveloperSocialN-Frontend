// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostRequestImpl _$$PostRequestImplFromJson(Map<String, dynamic> json) =>
    _$PostRequestImpl(
      codeSnippet: json['codeSnippet'] as String,
      description: json['description'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$PostRequestImplToJson(_$PostRequestImpl instance) =>
    <String, dynamic>{
      'codeSnippet': instance.codeSnippet,
      'description': instance.description,
      'tags': instance.tags,
    };
