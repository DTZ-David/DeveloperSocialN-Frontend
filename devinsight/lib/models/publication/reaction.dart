import 'package:freezed_annotation/freezed_annotation.dart';

part 'reaction.freezed.dart';
part 'reaction.g.dart';

@freezed
class Reaction with _$Reaction {
  const factory Reaction({
    required String userId,
    required String type, // Type only can be (verified or careful)
  }) = _Reaction;

  factory Reaction.fromJson(Map<String, dynamic> json) =>
      _$ReactionFromJson(json);
}
