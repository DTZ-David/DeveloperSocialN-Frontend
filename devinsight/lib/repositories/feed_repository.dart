import '../models/publication/post.dart';
import '../services/feed/feed_service.dart';

class FeedRepository {
  final FeedService _service;

  FeedRepository(this._service);

  Future<List<Post>> getFeed(String token) async {
    return await _service.fetchFeed(token);
  }
}
