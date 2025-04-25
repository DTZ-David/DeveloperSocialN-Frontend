import 'package:devinsight/ui/widgets/searchNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final selectedFiltersProvider = StateNotifierProvider<FilterNotifier, Set<String>>((ref) {
  return FilterNotifier();
});

class FilterNotifier extends StateNotifier<Set<String>> {
  FilterNotifier() : super({});

  void toggle(String filter) {
    if (state.contains(filter)) {
      state = {...state}..remove(filter);
    } else {
      state = {...state, filter};
    }
  }

  void clear() => state = {};
}

class ExplorerPage extends ConsumerWidget {
  const ExplorerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);
    final selectedFilters = ref.watch(selectedFiltersProvider);
    final filterNotifier = ref.read(selectedFiltersProvider.notifier);

    final allFilters = [
      "Python",
      "JavaScript",
      "AI",
      "Flutter",
      "Backend",
      "Frontend",
      "Data",
      "C#",
      "Kotlin"
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: MinimalSearchField(
            searchQueryProvider: searchQueryProvider,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: allFilters.map((filter) {
              final isSelected = selectedFilters.contains(filter);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilterChip(
                  label: Text(filter),
                  labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.white70),
                  backgroundColor: Colors.grey[800],
                  selectedColor: Colors.blueAccent,
                  selected: isSelected,
                  onSelected: (_) => filterNotifier.toggle(filter),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey[850],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const Icon(FontAwesomeIcons.code, color: Colors.blueAccent),
                  title: Text("Post #$index - ${searchQuery.isEmpty ? "sin buscar" : searchQuery}",
                      style: const TextStyle(color: Colors.white)),
                  subtitle: Text("Etiquetas: ${selectedFilters.join(', ')}",
                      style: const TextStyle(color: Colors.white54)),
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
