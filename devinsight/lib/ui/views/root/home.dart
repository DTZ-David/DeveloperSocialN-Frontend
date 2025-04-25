// lib/ui/views/root/home.dart
import 'package:devinsight/config/providers/publications_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/ui/widgets/publicationsCard.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publications = ref.watch(publicationsProvider);

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: publications.length,
      itemBuilder: (context, index) {
        final data = publications[index];
        return Column(
          children: [
            PublicationsCard(
              title: data['title'],
              subtitle: data['subtitle'],
              iconPath: data['iconPath'],
              description: data['description'],
              code: data['code'],
              reactions: List<int>.from(data['reactions']),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
