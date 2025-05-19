// repositories/user_post_repository.dart
import '../models/publication/post.dart';
import '../services/explorer/user_post_service.dart';

class UserPostRepository {
  final UserPostService _service;

  UserPostRepository(this._service);

  Future<List<Post>> getUserPosts(String email, String token) {
    return _service.fetchUserPosts(email, token);
  }
}
