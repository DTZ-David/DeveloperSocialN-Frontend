import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/core/app_colors.dart';
import 'package:devinsight/ui/widgets/auth/customNotificationIcon.dart';
import 'package:devinsight/ui/widgets/auth/customSettingsIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/ui/widgets/navBar.dart';
import 'package:devinsight/ui/views/root/home.dart';
import 'package:devinsight/ui/views/root/explorer.dart';
import 'package:devinsight/ui/views/root/profile.dart';
import 'package:devinsight/ui/views/root/publications.dart';
import 'package:devinsight/config/providers/navbar_index_provider.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Publications();
      case 2:
        return const ExplorerPage();
      case 3:
        return const Profile(); // otra pantalla si quieres
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
      appBar: AppBar(
        shadowColor: AppColors.tertiaryColors,
        elevation: 0.2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        backgroundColor: AppColors.primaryColors,
        title: GestureDetector(
          onTap: () {
            ref.read(appRouterProvider).go(AppRouter.home);
          },
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/saturn.svg',
                width: 40,
                height: 40,
                colorFilter: const ColorFilter.mode(
                  AppColors.tertiaryColors,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "Devinsight",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: const [
          //Icono de notificación
          CustomNotificationIcon(),
          //Icono de configuración
          Customsettingsicon(),
        
        ],
      ),
      body: _buildScreen(index),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}
