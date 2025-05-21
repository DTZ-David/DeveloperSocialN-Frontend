// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      userName: json['userName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      profilePicture: json['profilePicture'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      postsCount: (json['postsCount'] as num?)?.toInt() ?? 0,
      followersCount: (json['followersCount'] as num?)?.toInt() ?? 0,
      currentFollow: json['currentFollow'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'bio': instance.bio,
      'postsCount': instance.postsCount,
      'followersCount': instance.followersCount,
      'currentFollow': instance.currentFollow,
    };
