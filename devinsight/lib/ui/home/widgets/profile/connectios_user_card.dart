// connections_user_card.dart
import 'package:devinsight/models/user/user_dto.dart';
import 'package:flutter/material.dart';

class ConnectionsUserCard extends StatelessWidget {
  final UserDto user;

  const ConnectionsUserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.black,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.profilePicture ?? ''),
            radius: 24,
          ),
          title: Text(
            user.userName ?? 'Usuario',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
          subtitle: Text(
            user.bio ?? '',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontFamily: 'Montserrat',
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${user.postsCount} posts',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                '${user.followersCount} seguidores',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          onTap: () {
            // Puedes navegar a perfil aquí si quieres
          },
        ),
      ),
    );
  }
}
