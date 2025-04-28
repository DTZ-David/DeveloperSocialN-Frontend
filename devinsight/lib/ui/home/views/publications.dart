import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Publications extends ConsumerWidget {
  const Publications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Contenido de Publicaciones',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
