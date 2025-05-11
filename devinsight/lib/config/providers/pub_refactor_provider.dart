// lib/providers/post_refactor_provider.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/models/publication/post_refactor.dart';

final postRefactorProvider =
    StateNotifierProvider<PostRefactorNotifier, List<PostRefactor>>(
  (ref) => PostRefactorNotifier()..loadPosts(),
);

final myProfilePostRefactorProvider =
    Provider.family<List<PostRefactor>, String>((ref, userName) {
  final allPosts = ref.watch(postRefactorProvider);
  return allPosts.where((post) => post.authorUsername == userName).toList();
});

class PostRefactorNotifier extends StateNotifier<List<PostRefactor>> {
  PostRefactorNotifier() : super([]);

  Future<void> loadPosts() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/publications.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      state = jsonList
          .map((json) => PostRefactor.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error al cargar publicaciones refactorizadas: $e');
    }
  }
}
