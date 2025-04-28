import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTechProvider =
    StateNotifierProvider<SelectedTechNotifier, Set<String>>((ref) {
  return SelectedTechNotifier();
});

class SelectedTechNotifier extends StateNotifier<Set<String>> {
  
  SelectedTechNotifier() : super({});

  void toggle(String tech) {
    if (state.contains(tech)) {
      state = {...state}..remove(tech);
    } else if (state.length < 10) {
      state = {...state, tech};
    }
  }
  
}