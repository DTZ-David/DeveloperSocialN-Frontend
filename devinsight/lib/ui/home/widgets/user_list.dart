import 'package:devinsight/models/user/user_mapper.dart';
import 'package:devinsight/ui/home/widgets/connectionsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/usernameController.dart';

class UserList extends ConsumerWidget {
  final String searchQuery;

  const UserList({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref
        .watch(userSearchControllerProvider(searchQuery)); // ⚠️ Asumiendo que ya le pasas el nombre

    return userAsync.when(
      data: (user) {
        // Mostrar solo si el nombre coincide
        if (!user.userName.toLowerCase().contains(searchQuery.toLowerCase())) {
          return const Center(child: Text("Sin resultados"));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                CustomUserCard(user: user.toDomain()),
                // otros widgets si quieres en el futuro
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
