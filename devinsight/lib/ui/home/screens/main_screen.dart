import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:devinsight/ui/login/widgets/customNotificationIcon.dart';
import 'package:devinsight/ui/login/widgets/customSettingsIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/ui/home/widgets/navBar.dart';
import 'package:devinsight/config/providers/navbar_index_provider.dart';
import 'package:flutter_svg/svg.dart';
import '../views/create_post.dart';
import '../views/explorer.dart';
import '../views/home.dart';
import '../views/profile.dart';
import '../views/publications.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Publications();
      case 2:
        return const CreatePostView();
      case 3:
        return const ExplorerPage(); // otra pantalla si quieres
      case 4:
        return const Profile();
      default:
        return const Center(child: Text('Pantalla no encontrada'));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navbarIndexProvider);
    return Scaffold(
      body: _buildScreen(index),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}
