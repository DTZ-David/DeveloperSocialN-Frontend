import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier reutilizable para cualquier tipo de selección
class SelectedTechNotifier extends StateNotifier<Set<String>> {
  SelectedTechNotifier() : super({});

  void toggle(String tech) {
    if (state.contains(tech)) {
      state = {...state}..remove(tech);
    } else if (state.length < 10) {
      state = {...state, tech};
    }
  }

  void reset() {
    state = {};
  }
}

/// Selección de lenguajes
final selectedLanguagesProvider =
    StateNotifierProvider<SelectedTechNotifier, Set<String>>(
        (ref) => SelectedTechNotifier());

/// Selección de herramientas
final selectedToolsProvider =
    StateNotifierProvider<SelectedTechNotifier, Set<String>>(
        (ref) => SelectedTechNotifier());
