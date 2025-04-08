import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/login/widgets/publicationsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devinsight/ui/login/widgets/navBar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              print("Logo clicked");
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/saturn.svg',
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                    Colors.lightBlue,
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
                      content: const Text(
                        "No tienes notificaciones.",
                        style: TextStyle(color: Colors.white),
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
        backgroundColor: const Color(0xFF0E0B1F),
        bottomNavigationBar: const CustomNavbar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1A30), // Fondo opcional
                  borderRadius: BorderRadius.circular(12), // Bordes redondeados
                ),
                padding: const EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () {
                    ref.read(appRouterProvider).go(AppRouter.home);
                  },
                  child: const Center(
                    child: Text(
                      "Publicaciones",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Publicationscard(),
                    Publicationscard(),
                    Publicationscard(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
