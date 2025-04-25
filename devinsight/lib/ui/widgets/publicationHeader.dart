import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PublicationHeader extends StatelessWidget {
  final String userName;
  final String subtitle;
  final String iconPath;

  const PublicationHeader({
    super.key,
    required this.userName,
    required this.subtitle,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: SvgPicture.asset(iconPath, height: 30, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userName,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            Text(subtitle,
                style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
