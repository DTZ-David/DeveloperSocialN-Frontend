import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/follow/follow_service.dart';
import '../../repositories/follow_repository.dart';

import '../../config/providers/auth_provider.dart';

final followRepositoryProvider = Provider<FollowRepository>((ref) {
  return FollowRepository(FollowService());
});

final userFollowControllerProvider =
    StateNotifierProviderFamily<UserFollowController, bool, ({String email, bool initialFollow})>(
  (ref, params) {
    final repo = ref.read(followRepositoryProvider);
    return UserFollowController(repo, ref, params.email, params.initialFollow);
  },
);

class UserFollowController extends StateNotifier<bool> {
  final FollowRepository _repository;
  final Ref ref;
  final String userEmail;

  UserFollowController(this._repository, this.ref, this.userEmail, bool initialFollow)
      : super(initialFollow);

  Future<void> toggleFollow() async {
    final token = ref.read(authProvider).token;

    try {
      await _repository.followUser(token, userEmail);
      state = !state;
    } catch (e) {
      // Mostrar snackbar o log si quieres
    }
  }
}
