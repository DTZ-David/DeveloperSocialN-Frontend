import 'dart:convert';
import 'package:devinsight/config/providers/selectedProvider.dart';
import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/models/language_icon.dart';
import 'package:devinsight/ui/login/widgets/customButton.dart';
import 'package:devinsight/ui/login/widgets/customChoiceChip.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectableItemsPage extends ConsumerStatefulWidget {
  final String title;
  final String description;
  final String jsonAssetPath;
  final StateNotifierProvider<StateNotifier<Set<String>>, Set<String>>
      selectedProvider;
  final Map<String, IconData> iconMap;
  final String backRoute;
  final String nextRoute;

  const SelectableItemsPage({
    super.key,
    required this.title,
    required this.description,
    required this.jsonAssetPath,
    required this.selectedProvider,
    required this.iconMap,
    required this.backRoute,
    required this.nextRoute,
  });

  @override
  ConsumerState<SelectableItemsPage> createState() =>
      _SelectableItemsPageState();
}

class _SelectableItemsPageState extends ConsumerState<SelectableItemsPage> {
  List<LanguageIcon> allItems = [];
  List<LanguageIcon> filteredItems = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    final String response = await rootBundle.loadString(widget.jsonAssetPath);
    final List<dynamic> data = json.decode(response);
    final parsed = data.map((e) => LanguageIcon.fromJson(e)).toList();

    setState(() {
      allItems = parsed;
      filteredItems = parsed;
    });
  }

  void filterItems(String query) {
    setState(() {
      searchQuery = query;
      filteredItems = allItems
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedSet = ref.watch(widget.selectedProvider);

    return Scaffold(
      body: Container(
        color: AppColors.background,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // AppBar
            Container(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      ref.read(appRouterProvider).go(widget.backRoute);
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(appRouterProvider).go('/main');
                    },
                    child: const Text(
                      "Saltar",
                      style: TextStyle(
                          color: AppColors.accent,
                          fontSize: 16,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                ],
              ),
            ),

            // Titles
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),

            // SearchBar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.thirdColors,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: TextField(
                    onChanged: filterItems,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/icons/search-line.svg",
                            color: Colors.white70,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      hintText: "Buscar",
                      hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Items List
            Expanded(
              child: filteredItems.isEmpty
                  ? const Center(
                      child: Text(
                        "No hay resultados",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Wrap(
                        spacing: 4,
                        runSpacing: 2,
                        alignment: WrapAlignment.spaceBetween,
                        children: filteredItems.map((item) {
                          final isSelected = selectedSet.contains(item.name);
                          final icon = widget.iconMap[item.iconName] ??
                              Icons.question_mark;

                          return CustomChoiceChip(
                            label: item.name,
                            isSelected: isSelected,
                            icon: icon,
                            onSelected: () {
                              final notifier =
                                  ref.read(widget.selectedProvider.notifier)
                                      as SelectedTechNotifier;
                              notifier.toggle(item.name);
                            },
                          );
                        }).toList(),
                      ),
                    ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: CustomButton(
                text: "Continuar",
                onPressed: () {
                  print("Selected items: $selectedSet");
                  ref.read(appRouterProvider).go(widget.nextRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
