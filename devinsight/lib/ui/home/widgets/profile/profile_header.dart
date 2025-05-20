import 'package:devinsight/models/user/user.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import 'stat_card.dart';
import 'social_buttons_row.dart';

class ProfileHeader extends StatelessWidget {
  final User user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(color: AppColors.primaryColors),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:
                user.profilePicture != null ? NetworkImage(user.profilePicture!) : null,
            child: user.profilePicture == null
                ? const Icon(Icons.person, size: 40, color: Colors.white)
                : null,
          ),
          const SizedBox(height: 12),
          Text(
            user.userName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              user.email,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatCard(title: '${user.postsCount}', subtitle: 'Posts'),
              const SizedBox(width: 20),
              StatCard(title: '${user.followersCount}', subtitle: 'Seguidores'),
            ],
          ),
          const SizedBox(height: 10),
          const SocialButtonsRow(buttonText: 'Seguir'),
        ],
      ),
    );
  }
}
