import '../services/follow/follow_service.dart';

class FollowRepository {
  final FollowService _service;

  FollowRepository(this._service);

  Future<void> followUser(String token, String followerEmail) async {
    await _service.followUser(token, followerEmail);
  }
}
