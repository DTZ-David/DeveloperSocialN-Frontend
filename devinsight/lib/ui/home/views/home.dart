// lib/ui/views/root/home.dart
import 'package:devinsight/ui/home/widgets/publicationsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/feedController.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Se observa el estado del feed usando el FeedController
    final feedState = ref.watch(feedControllerProvider);

    return feedState.when(
      data: (publications) {
        return Container(
          color: const Color.fromARGB(255, 24, 23, 23),
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: publications.length,
            itemBuilder: (context, index) {
              final post = publications[index]; // El tipo 'Post' ahora es más claro
              return Column(
                children: [
                  PublicationsCard(
                    userName: post.userName, // O el campo que corresponda
                    sentAt: post.likes.toString(), // Reemplaza con la fecha si es necesario
                    userIcon: post
                        .profilePicture, // Puedes poner el campo de la foto de usuario si existe
                    description: post.description,
                    code: post.codeSnippet,
                    language: '', // Puedes agregar el lenguaje si lo tienes en el modelo
                    // reactions: ,
                    tags: post.tags,
                  ),
                  const SizedBox(height: 4),
                ],
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()), // Indicador de carga
      error: (e, stackTrace) =>
          Center(child: Text('Error: $e')), // Muestra el error si ocurre alguno
    );
  }
}
