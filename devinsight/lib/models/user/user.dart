import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {required String id,
      @Default('') String userName,
      @Default('') String email,
      @Default('') String profilePicture,
      @Default('') String bio,
      @Default(0) int postsCount,
      @Default(0) int followersCount,
      required bool currentFollow}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
