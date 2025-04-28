import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final toolsProvider =
    StateNotifierProvider<ToolsNotifier, List<Map<String, dynamic>>>(
  (ref) => ToolsNotifier()..loadTools(),
);

class ToolsNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  ToolsNotifier() : super([]);

  Future<void> loadTools() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/tools.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      state = jsonList.cast<Map<String, dynamic>>();
    } catch (e) {
      print('Error al cargar tools: $e');
    }
  }
}