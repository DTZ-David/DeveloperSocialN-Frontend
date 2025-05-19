import 'package:devinsight/models/publication/comment_request.dart';

import '../services/feed/comment_request_service.dart';

class CommentRequestRepository {
  final CommentRequestService _service;

  CommentRequestRepository(this._service);

  Future<void> sendComment(CommentRequest request, String token) {
    return _service.sendComment(request, token);
  }
}
