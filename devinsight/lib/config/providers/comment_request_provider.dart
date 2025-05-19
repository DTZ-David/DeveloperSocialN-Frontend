import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controller/comment_request_controller.dart';
import '../../repositories/comment_request_repository.dart';
import '../../services/feed/comment_request_service.dart';

final commentServiceProvider = Provider((ref) => CommentRequestService());

final commentRepositoryProvider = Provider(
  (ref) => CommentRequestRepository(ref.read(commentServiceProvider)),
);

final sendCommentProvider = StateNotifierProvider<CommentRequestController, AsyncValue<void>>(
  (ref) => CommentRequestController(ref.read(commentRepositoryProvider)),
);
