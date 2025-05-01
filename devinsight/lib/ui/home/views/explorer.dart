import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:devinsight/ui/home/widgets/searchNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final selectedFiltersProvider =
    StateNotifierProvider<FilterNotifier, Set<String>>((ref) {
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

    return Scaffold(
      backgroundColor: AppColors.thirdColors,
      appBar: AppBar(
        shadowColor: AppColors.tertiaryColors,
        elevation: 0.2,
        backgroundColor: AppColors.primaryColors,
        title: const Row(
          children: [
            SizedBox(width: 16),
            Text(
              "Explorar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
        actions: const [
          SizedBox(width: 16),
        ],
      ),
      body: Column(
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
                    labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.white70,
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    backgroundColor: AppColors.secondaryColors,
                    selectedColor: AppColors.accent,
                    selected: isSelected,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(color: Colors.transparent),
                    ),
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
                  color: AppColors.secondaryColors,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      'assets/icons/code.svg',
                      // ignore: deprecated_member_use
                      color: Colors.white,
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                        "Post #$index - ${searchQuery.isEmpty ? "sin buscar" : searchQuery}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 14)),
                    subtitle: Text("Etiquetas: ${selectedFilters.join(', ')}",
                        style: const TextStyle(
                            color: Colors.white54,
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
