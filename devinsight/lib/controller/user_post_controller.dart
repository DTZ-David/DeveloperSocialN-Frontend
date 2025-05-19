// controllers/user_post_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/publication/post.dart';
import '../../repositories/user_post_repository.dart';
import '../config/providers/auth_provider.dart';
import '../config/providers/user_post_provider.dart';

final userPostControllerProvider =
    StateNotifierProvider.family<UserPostController, AsyncValue<List<Post>>, String>((ref, email) {
  final repo = ref.read(userPostRepositoryProvider);
  final token = ref.read(authProvider).token;
  return UserPostController(repo, token, email);
});

class UserPostController extends StateNotifier<AsyncValue<List<Post>>> {
  final UserPostRepository _repo;
  final String _token;
  final String _email;

  UserPostController(this._repo, this._token, this._email) : super(const AsyncValue.loading()) {
    loadUserPosts();
  }

  Future<void> loadUserPosts() async {
    try {
      final posts = await _repo.getUserPosts(_email, _token);
      state = AsyncValue.data(posts);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
