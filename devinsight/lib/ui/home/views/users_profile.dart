import 'package:devinsight/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/app_colors.dart';
import '../widgets/navProfile.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/user_bio.dart';

class UsersProfileView extends ConsumerWidget {
  final User user;

  const UsersProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(user: user),
            const SizedBox(height: 10),
            UserBio(bio: user.bio ?? "Sin biografía"),
            const NavProfile(),
          ],
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
    );
  }
}
