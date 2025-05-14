import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repositories/feed_repository.dart';
import '../../../config/providers/auth_provider.dart';
import '../config/providers/feed_provider.dart';
import '../models/publication/post.dart';

final profileFeedControllerProvider =
    StateNotifierProvider<FeedController, AsyncValue<List<Post>>>((ref) {
  final feedRepository = ref.read(feedRepositoryProvider);
  return FeedController(feedRepository, ref);
});

class FeedController extends StateNotifier<AsyncValue<List<Post>>> {
  final FeedRepository _feedRepository;
  final Ref ref;

  FeedController(this._feedRepository, this.ref) : super(const AsyncValue.loading()) {
    loadFeed(); // <- esto carga el feed automáticamente al instanciarse
  }

  Future<void> loadFeed() async {
    final token = ref.read(authProvider).token;

    try {
      final feed = await _feedRepository.getFeed(token);
      state = AsyncValue.data(feed);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
