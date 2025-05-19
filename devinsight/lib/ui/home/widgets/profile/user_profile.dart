import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/providers/auth_provider.dart';
import '../../../theme/app_colors.dart';

class UserProfile extends ConsumerWidget {
  final String bannerUrl;
  final String profileImageUrl;

  const UserProfile({
    super.key,
    required this.bannerUrl,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 110,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(bannerUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.secondaryColors,
                ),
              ),
              Positioned(
                bottom: -40,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(user.profilePicture),
                ),
              ),
              Positioned(
                bottom: -70,
                child: Text(
                  user.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
