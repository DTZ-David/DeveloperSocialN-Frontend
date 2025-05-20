// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      email: json['email'] as String,
      userName: json['userName'] as String,
      profilePicture: json['profilePicture'] as String,
      bio: json['bio'] as String,
      postsCount: (json['postsCount'] as num).toInt(),
      followersCount: (json['followersCount'] as num).toInt(),
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'userName': instance.userName,
      'profilePicture': instance.profilePicture,
      'bio': instance.bio,
      'postsCount': instance.postsCount,
      'followersCount': instance.followersCount,
    };
