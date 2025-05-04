// lib/ui/views/root/home.dart
import 'package:devinsight/ui/home/widgets/publicationsCard.dart';
import 'package:devinsight/ui/login/widgets/customNotificationIcon.dart';
import 'package:devinsight/ui/login/widgets/customSettingsIcon.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/feedController.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Se observa el estado del feed usando el FeedController
    final feedState = ref.watch(feedControllerProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          print('Botón de refresh presionado');

          // ignore: unused_result
          ref.refresh(feedControllerProvider);
        },
        backgroundColor: AppColors.primaryColors,
        child: const Icon(
          Icons.replay_circle_filled_outlined,
          size: 30,
        ),
      ),
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
      body: feedState.when(
        data: (publications) {
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: publications.length,
            itemBuilder: (context, index) {

              final post = publications[index];
              final post = publications[index]; // El tipo 'Post' ahora es más claro

              return Column(
                children: [
                  PublicationsCard(
                    userName: post.userName,
                    sentAt: post.likes.toString(),
                    userIcon: post.profilePicture,
                    description: post.description,
                    code: post.codeSnippet,

                    language: '',
               

                    tags: post.tags,
                  ),
                  const SizedBox(height: 4),
                ],
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()), // Indicador de carga
        error: (e, stackTrace) =>
            Center(child: Text('Error: $e')), // Muestra el error si ocurre alguno
      ),
    );
  }
}
