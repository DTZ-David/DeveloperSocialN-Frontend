import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/publication/post_request.dart';
import '../../../config/providers/auth_provider.dart';
import '../config/providers/post_provider.dart';
import '../repositories/post_request_repository.dart';

final postControllerProvider = StateNotifierProvider<PostController, AsyncValue<void>>((ref) {
  final repository = ref.read(postRepositoryProvider);
  return PostController(repository, ref);
});

class PostController extends StateNotifier<AsyncValue<void>> {
  final PostRepository _repository;
  final Ref ref;

  PostController(this._repository, this.ref) : super(const AsyncValue.data(null));

  Future<void> createPost(PostRequest post) async {
    final token = ref.read(authProvider).token;

    state = const AsyncValue.loading();
    try {
      await _repository.createPost(token, post);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
