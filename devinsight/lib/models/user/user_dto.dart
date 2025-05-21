import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto(
      {required String email,
      required String userName,
      required String profilePicture,
      required String bio,
      required int postsCount,
      required int followersCount,
      required bool currentFollow}) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}
