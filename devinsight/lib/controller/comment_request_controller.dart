import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/models/publication/comment_request.dart';
import '../repositories/comment_request_repository.dart';

class CommentRequestController extends StateNotifier<AsyncValue<void>> {
  final CommentRequestRepository repository;

  CommentRequestController(this.repository) : super(const AsyncData(null));

  Future<void> send(CommentRequest request, String token) async {
    state = const AsyncLoading();
    try {
      await repository.sendComment(request, token);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
