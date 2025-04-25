import 'package:devinsight/ui/views/root/publicationsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                PublicationsCard(),
                PublicationsCard(),
                PublicationsCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
