import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define el provider para los lenguajes
final languagesProvider = StateNotifierProvider<LanguagesNotifier, List<Map<String, dynamic>>>(
  (ref) => LanguagesNotifier()..loadLanguages(),
);

class LanguagesNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  LanguagesNotifier() : super([]);

  // Método para cargar los lenguajes desde el archivo JSON
  Future<void> loadLanguages() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/languages.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      
      state = jsonList.cast<Map<String, dynamic>>();
    } catch (e) {
      print('Error al cargar languages: $e');
    }
  }
}
