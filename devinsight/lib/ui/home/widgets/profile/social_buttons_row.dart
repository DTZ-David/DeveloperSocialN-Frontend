import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/app_colors.dart';

class SocialButtonsRow extends StatelessWidget {
  final String buttonText;

  const SocialButtonsRow({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => print('Follow Action'),
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
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => print('Go to message'),
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
              color: AppColors.accent,
            ),
          ),
        )
      ],
    );
  }
}
