import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class UserBio extends StatelessWidget {
  final String bio;

  const UserBio({super.key, required this.bio});

  @override
  Widget build(BuildContext context) {
    if (bio.trim().isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
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
    );
  }
}
