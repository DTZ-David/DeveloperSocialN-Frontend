// lib/providers/publications_provider.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final publicationsProvider =
    StateNotifierProvider<PublicationsNotifier, List<Map<String, dynamic>>>(
  (ref) => PublicationsNotifier()..loadPublications(),
);

final myProfilePublicationsProvider = Provider.family<List<Map<String, dynamic>>, String>((ref, userName) {
  final allPublications = ref.watch(publicationsProvider);
  return allPublications
      .where((pub) => pub['user_name'] == userName)
      .toList();
});

class PublicationsNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  PublicationsNotifier() : super([]);

  Future<void> loadPublications() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/publications.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      state = jsonList.cast<Map<String, dynamic>>();
    } catch (e) {
      print('Error al cargar publicaciones: $e');
    }
  }
}
