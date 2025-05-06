import 'package:devinsight/config/providers/users_provider.dart';
import 'package:devinsight/ui/home/widgets/connectionsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserList extends ConsumerWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);

    return usersAsync.when(
      data: (users) => ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return CustomUserCard(user: user);
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
