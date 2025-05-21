import 'package:devinsight/models/user/user_mapper.dart';
import 'package:devinsight/ui/home/widgets/connectionsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/providers/follow_provider.dart';
import '../../../controller/usernameController.dart';

class UserList extends ConsumerWidget {
  final String searchQuery;

  const UserList({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Si la búsqueda está vacía, mostramos una vista amigable
    if (searchQuery.trim().isEmpty) {
      return const _SearchPrompt();
    }

    final userAsync = ref.watch(userSearchControllerProvider(searchQuery));

    return userAsync.when(
      data: (user) {
        if (!user.userName.toLowerCase().contains(searchQuery.toLowerCase())) {
          return const _EmptyResult();
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                CustomUserCard(user: user.toDomain()),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        // Si hubo un error pero la búsqueda estaba vacía, igual mostramos la vista amigable
        return const _EmptyResult();
      },
    );
  }
}

class _SearchPrompt extends StatelessWidget {
  const _SearchPrompt();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Busca un usuario para comenzar',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _EmptyResult extends StatelessWidget {
  const _EmptyResult();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_off, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No se encontró ningún usuario',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
