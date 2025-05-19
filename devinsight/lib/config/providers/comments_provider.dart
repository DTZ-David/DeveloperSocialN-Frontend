import 'package:devinsight/config/providers/auth_provider.dart';
import 'package:devinsight/models/publication/comment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/comment_controller.dart';
import '../../repositories/comment_repository.dart';
import '../../services/feed/comment_service.dart';

// Service
final commentServiceProvider = Provider((ref) => CommentService());

// Repository
final commentRepositoryProvider = Provider(
  (ref) => CommentRepository(ref.read(commentServiceProvider)),
);

// Controller
final commentControllerProvider = Provider(
  (ref) => CommentController(ref.read(commentRepositoryProvider)),
);

// Provider con token y postId
final commentsByPostIdProvider = FutureProvider.family<List<Comment>, String>((ref, postId) async {
  final token = ref.watch(authProvider.select((auth) => auth.token));
  if (token.isEmpty) throw Exception('No token');

  final controller = ref.read(commentControllerProvider);
  return await controller.getComments(postId, token);
});

final userInteractionsProvider = FutureProvider.autoDispose<List<Comment>>((ref) async {
  final token = ref.watch(authProvider.select((auth) => auth.token));
  if (token.isEmpty) throw Exception('No token');

  final controller = ref.watch(commentControllerProvider);
  return await controller.getUserInteractions(token);
});
