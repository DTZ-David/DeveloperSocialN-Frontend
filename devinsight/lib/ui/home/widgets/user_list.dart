import 'package:devinsight/config/providers/users_provider.dart';
import 'package:devinsight/ui/home/widgets/connectionsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserList extends ConsumerWidget {
  final String searchQuery;

  const UserList(
      {super.key, required this.searchQuery}); // ← usar this.searchQuery

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);

    return usersAsync.when(
      data: (users) {
        // Filtrar usuarios por nombre
        final filteredUsers = users.where((user) {
          return user.username
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
        }).toList();

        return ListView.builder(
          itemCount: filteredUsers.length,
          itemBuilder: (context, index) {
            final user = filteredUsers[index];

            return CustomUserCard(user: user);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
