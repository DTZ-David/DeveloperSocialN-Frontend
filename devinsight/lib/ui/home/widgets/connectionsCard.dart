import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:devinsight/ui/theme/app_colors.dart';

class CustomUserCard extends ConsumerWidget {
  final User user;

  const CustomUserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: () {
          ref.read(appRouterProvider).goNamed(
                'user_profile',
                pathParameters: {'id': user.id},
                extra: user.toJson(),
              );
        },
        child: Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePicture),
                  radius: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.bio,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                _buildIconContainer(
                  'assets/icons/user_add_profile.svg',
                  AppColors.accent,
                ),
                const SizedBox(width: 10),
                _buildIconContainer(
                  'assets/icons/message_profile.svg',
                  AppColors.secondaryColors,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconContainer(String assetPath, Color backgroundColor) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: SvgPicture.asset(assetPath, width: 20, height: 20),
      ),
    );
  }
}
