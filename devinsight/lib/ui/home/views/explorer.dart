import 'package:devinsight/ui/home/widgets/user_list.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:devinsight/ui/home/widgets/searchNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final selectedViewProvider = StateProvider<String>((ref) => 'Usuarios');

class ExplorerPage extends ConsumerWidget {
  const ExplorerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);
    final selectedView = ref.watch(selectedViewProvider);
    final selectedViewNotifier = ref.read(selectedViewProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.thirdColors,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColors,
        elevation: 0.2,
        title: const Text(
          "Explorar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: MinimalSearchField(
              searchQueryProvider: searchQueryProvider,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedView == 'Usuarios' ? AppColors.accent : AppColors.primaryColors,
                ),
                onPressed: () => selectedViewNotifier.state = 'Usuarios',
                child: const Text(
                  'Usuarios',
                  style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedView == 'Publicaciones' ? AppColors.accent : AppColors.primaryColors,
                ),
                onPressed: () => selectedViewNotifier.state = 'Publicaciones',
                child: const Text(
                  'Publicaciones',
                  style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: selectedView == 'Usuarios'
                ? UserList(searchQuery: searchQuery) // ← searchQuery se pasa correctamente
                : const Center(
                    child: Text(
                      "Aquí van las publicaciones",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
