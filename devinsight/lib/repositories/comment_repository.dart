import 'package:devinsight/models/publication/comment.dart';

import '../services/feed/comment_service.dart';

class CommentRepository {
  final CommentService _commentService;

  CommentRepository(this._commentService);

  Future<List<Comment>> fetchComments(String postId, String token) {
    return _commentService.getCommentsByPostId(postId, token);
  }

  Future<List<Comment>> getUserInteractions(String token) {
    return _commentService.getUserInteractions(token);
  }
}
