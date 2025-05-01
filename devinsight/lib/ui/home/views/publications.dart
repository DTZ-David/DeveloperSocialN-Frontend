import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Publications extends ConsumerWidget {
  const Publications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.tertiaryColors,
        elevation: 0.2,
        backgroundColor: AppColors.primaryColors,
        title: const Row(
          children: [
            SizedBox(width: 16),
            Text(
              "Pubs Guardadas",
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
      backgroundColor: const Color.fromARGB(255, 21, 20, 20),
      body: const Center(
        child: Text(
          'Contenido de Publicaciones',
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
