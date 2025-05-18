// lib/models/user/user_mapper.dart

import 'user.dart';
import 'user_dto.dart';

extension UserDtoMapper on UserDto {
  User toDomain() {
    return User(
      id: "0", // Usa el ID real si lo tienes en el UserDto
      username: userName,
      email: email,
      profilePicture: '',
      bio: '',
      postsCount: 0,
      followersCount: 0,
    );
  }
}
