// feed_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/feed/feed_service.dart';
import '../../repositories/feed_repository.dart';
import '../providers/auth_provider.dart';

final feedRepositoryProvider = Provider<FeedRepository>((ref) {
  return FeedRepository(FeedService());
});

final feedProvider = FutureProvider.autoDispose((ref) async {
  final token = ref.watch(authProvider.select((auth) => auth.token));
  if (token.isEmpty) throw Exception('No token');

  final repo = ref.watch(feedRepositoryProvider);
  return await repo.getFeed(token);
});
