import 'package:devinsight/config/routers/app_router.dart';
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
        shadowColor: Colors.lightBlue,
        elevation: 0.2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        backgroundColor: const Color(0xFF0E0B1F),
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
                  Colors.lightBlue,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "pepigod",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: const Color(0xFF1C1A30),
                    title: const Text(
                      "Notificaciones",
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.email, color: Colors.blue),
                          title: const Text('Email Notifications',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Add your email notifications logic here
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.sms, color: Colors.green),
                          title: const Text('SMS Notifications',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Add your SMS notifications logic here
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.push_pin, color: Colors.orange),
                          title: const Text('Push Notifications',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Add your push notifications logic here
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          "Cerrar",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: const Color(0xFF1C1A30),
                    title: const Text(
                      "Ajustes",
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.account_circle,
                              color: Colors.blue),
                          title: const Text('Cuenta',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Add your account settings logic here
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.notifications,
                              color: Colors.orange),
                          title: const Text('Notificaciones',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Add your notifications settings logic here
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.security, color: Colors.red),
                          title: const Text('Seguridad',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Add your security settings logic here
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          "Cerrar",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: _buildScreen(index),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}
