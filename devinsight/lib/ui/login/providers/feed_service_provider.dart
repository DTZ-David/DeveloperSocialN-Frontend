import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/feed_repository.dart';
import '../../../services/feed/feed_service.dart';

final feedRepositoryProvider = Provider<FeedRepository>((ref) {
  final feedService = FeedService();
  return FeedRepository(feedService);
});
