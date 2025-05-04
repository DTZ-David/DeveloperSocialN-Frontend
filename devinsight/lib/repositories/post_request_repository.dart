import '../../models/publication/post_request.dart';
import '../services/post/post_request_service.dart';

class PostRepository {
  final PostService _service;

  PostRepository(this._service);

  Future<void> createPost(String token, PostRequest post) async {
    await _service.createPost(token, post);
  }
}
