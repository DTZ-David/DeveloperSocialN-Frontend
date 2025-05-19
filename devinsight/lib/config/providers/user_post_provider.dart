import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repositories/user_post_repository.dart';
import '../../services/explorer/user_post_service.dart';

final userPostServiceProvider = Provider<UserPostService>((ref) {
  return UserPostService();
});

final userPostRepositoryProvider = Provider<UserPostRepository>((ref) {
  return UserPostRepository(UserPostService());
});
