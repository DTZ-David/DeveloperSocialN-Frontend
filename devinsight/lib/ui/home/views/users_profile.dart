import 'package:devinsight/config/providers/users_provider.dart';
import 'package:devinsight/ui/home/widgets/navProfile.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsersProfileView extends ConsumerWidget {
  final String userId;

  const UsersProfileView({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userByIdProvider(int.parse("1")));

    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: AppColors.background,
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (user) => SingleChildScrollView(
          child: Column(
            children: [
              _ProfileHeader(user: user),
              const SizedBox(height: 10),
              _UserBio(bio: user.bio),
              const NavProfile(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColors,
      title: const Text(
        "Perfil",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
      ),
      actions: const [SizedBox(width: 16)],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final dynamic user;

  const _ProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      decoration: const BoxDecoration(
        color: AppColors.primaryColors,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: user.profilePicture != null ? NetworkImage(user.profilePicture) : null,
            child: user.profilePicture == null
                ? const Icon(Icons.person, size: 40, color: Colors.white)
                : null,
          ),
          const SizedBox(height: 12),
          Text(
            user.username ?? 'Unknown',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              user.email ?? 'No email provided',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _StatCard(
                title: user.postsCount?.toString() ?? '0',
                subtitle: 'Posts',
              ),
              const SizedBox(width: 20),
              _StatCard(
                title: user.followersCount?.toString() ?? '0',
                subtitle: 'Seguidores',
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const _SocialButtonsRow(
            buttonText: 'Seguir',
          ),
        ],
      ),
    );
  }
}

class _SocialButtonsRow extends StatelessWidget {
  final String buttonText;

  const _SocialButtonsRow({required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle button tap
            print('Follow Action');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1ABCFE),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            // Handle button tap
            print('Go to message with /id');
          },
          child: Container(
            width: 46,
            height: 42,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF1F212A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              "assets/icons/message_profile.svg",
              height: 100,
              width: 100,
              color: AppColors.accent,
            ),
          ),
        )
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final String iconPath;
  final Color color;

  const SocialButton({
    super.key,
    required this.iconPath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle button tap
        print('Button tapped');
      },
      child: Container(
        width: 48,
        height: 48,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF1F212A),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgPicture.asset(
          iconPath,
          height: 40,
          width: 40,
          color: color,
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _StatCard({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontFamily: "Montserrat",
          ),
        ),
      ],
    );
  }
}

class _UserBio extends StatelessWidget {
  final String bio;

  const _UserBio({required this.bio});

  @override
  Widget build(BuildContext context) {
    if (bio.trim().isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.thirdColors,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Text(
              bio,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Montserrat",
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
