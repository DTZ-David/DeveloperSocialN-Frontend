import 'package:devinsight/services/feed/profile_service.dart';

import '../models/publication/post.dart';

class ProfileFeedRepository {
  final ProfileService _service;

  ProfileFeedRepository(this._service);

  Future<List<Post>> getFeed(String token) async {
    return await _service.fetchProfileFeed(token);
  }
}
