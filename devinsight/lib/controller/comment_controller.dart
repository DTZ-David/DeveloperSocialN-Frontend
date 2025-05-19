import 'package:devinsight/models/publication/comment.dart';
import 'package:devinsight/repositories/comment_repository.dart';

class CommentController {
  final CommentRepository _repository;

  CommentController(this._repository);

  Future<List<Comment>> getComments(String postId, String token) {
    return _repository.fetchComments(postId, token);
  }
}
