import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repositories/follow_repository.dart';
import '../../config/providers/auth_provider.dart';
import '../config/providers/follow_provider.dart';

final followControllerProvider = StateNotifierProvider<FollowController, AsyncValue<void>>((ref) {
  final repo = ref.read(followRepositoryProvider);
  return FollowController(repo, ref);
});

class FollowController extends StateNotifier<AsyncValue<void>> {
  final FollowRepository _repository;
  final Ref ref;

  FollowController(this._repository, this.ref) : super(const AsyncData(null));

  Future<void> followUser(String followerEmail) async {
    final token = ref.read(authProvider).token;
    state = const AsyncLoading();

    try {
      await _repository.followUser(token, followerEmail);
      state = const AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
