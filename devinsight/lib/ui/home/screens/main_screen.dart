import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/ui/home/widgets/navBar.dart';
import 'package:devinsight/config/providers/navbar_index_provider.dart';
import '../views/create_post.dart';
import '../views/explorer.dart';
import '../views/home.dart';
import '../views/profile.dart';
import '../views/publications.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navbarIndexProvider);
    final pageController = PageController(initialPage: index);

    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (newIndex) {
          // Actualiza el índice del navbar cuando se desliza
          ref.read(navbarIndexProvider.notifier).state = newIndex;
        },
        children: const [
          HomeScreen(),
          ExplorerPage(),
          CreatePostView(),
          Publications(),
        
          
          Profile(showSocialButton: false),
        ],
      ),
      bottomNavigationBar: CustomNavbar(
        onTap: (newIndex) {
          // Cambia la página del PageView cuando se selecciona un ítem del navbar
          pageController.jumpToPage(newIndex);
          ref.read(navbarIndexProvider.notifier).state = newIndex;
        },
      ),
    );
  }
}