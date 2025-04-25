import 'package:devinsight/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: AppColors.primaryColors,
                    title: const Text(
                      "Notificaciones",
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.email, color: AppColors.tertiaryColors),
                          title: const Text('Email Notifications',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Add your email notifications logic here
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.sms, color: AppColors.quaternaryColors),
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
          ) ;
  }
}