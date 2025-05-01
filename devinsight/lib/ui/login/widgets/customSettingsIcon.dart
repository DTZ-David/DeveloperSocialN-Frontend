import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Customsettingsicon extends StatelessWidget {
  const Customsettingsicon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/settings.svg',
        color: Colors.white,
        width: 24,
        height: 24,
      ),
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
                    leading:
                        const Icon(Icons.account_circle, color: Colors.blue),
                    title: const Text('Cuenta',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Add your account settings logic here
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.notifications, color: Colors.orange),
                    title: const Text('Notificaciones',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Add your notifications settings logic here
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.security, color: Colors.red),
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
    );
  }
}
