// lib/ui/views/root/home.dart
import 'package:devinsight/ui/login/widgets/customNotificationIcon.dart';
import 'package:devinsight/ui/login/widgets/customSettingsIcon.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/feedController.dart';
import '../widgets/publicationsCard.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Se observa el estado del feed usando el FeedController
    final feedState = ref.watch(feedControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColors,
        title: const Row(
          children: [
            SizedBox(width: 16),
            Text(
              "Inicio",
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
          CustomNotificationIcon(),
          CustomSettingsIcon(),
          SizedBox(width: 16),
        ],
      ),
      backgroundColor: AppColors.thirdColors,
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(feedControllerProvider.notifier).loadFeed();

          // Muestra un SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Feed actualizado'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: feedState.when(
          data: (publications) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: publications.length,
              itemBuilder: (context, index) {
                final post = publications[index];

                return Column(
                  children: [
                    PublicationsCard(post: post),
                    const SizedBox(height: 4),
                  ],
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()), // Indicador de carga
          error: (e, stackTrace) =>
              Center(child: Text('Error: $e')),
        ),
      ),
    );
  }
}
