import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const StatCard({super.key, required this.title, required this.subtitle});

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
