import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    @Default('') String username,
    @Default('') String email,
    @Default('') String profilePicture,
    @Default('') String bio,
    @Default(0) int postsCount,
    @Default(0) int followersCount,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  get name => null;
}
