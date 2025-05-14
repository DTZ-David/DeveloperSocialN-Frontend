// lib/providers/post_refactor_provider.dart
import 'dart:convert';
import 'package:devinsight/models/publication/post.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postRefactorProvider = StateNotifierProvider<PostRefactorNotifier, List<Post>>(
  (ref) => PostRefactorNotifier()..loadPosts(),
);

final myProfilePostRefactorProvider = Provider.family<List<Post>, String>((ref, userId) {
  final allPosts = ref.watch(postRefactorProvider);
  return allPosts.where((post) => post.authorId == userId).toList();
});

class PostRefactorNotifier extends StateNotifier<List<Post>> {
  PostRefactorNotifier() : super([]);

  Future<void> loadPosts() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/publications.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      state = jsonList.map((json) => Post.fromJson(json as Map<String, dynamic>)).toList();
      print(jsonList);
    } catch (e) {
      print('Error al cargar publicaciones refactorizadas: $e');
    }
  }
}
