import 'package:devinsight/ui/home/widgets/optionsDialog.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
/*
String formatSentAt(String sentAtString) {
  final dateTime =
      DateTime.parse(sentAtString).toLocal(); 
  final now = DateTime.now();

  final difference = now.difference(dateTime);

  if (difference.inHours < 24) {
    return DateFormat('hh:mm a').format(dateTime);
  } else {
    return timeago.format(dateTime, locale: 'es');
  }
}*/

class PublicationHeader extends StatelessWidget {
  final String userName;
  final String sentAt;
  final String userIcon;

  const PublicationHeader({
    super.key,
    required this.userName,
    required this.sentAt,
    required this.userIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: userIcon == "" || userIcon.isEmpty
                    ? AppColors.accent
                    : null,
                backgroundImage: (userIcon != "" && userIcon.isNotEmpty)
                    ? NetworkImage(userIcon)
                    : null,
                radius: 20, // Adjust the size as needed
              ),
              const SizedBox(width: 10), // Space between icon and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    sentAt,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: GestureDetector(
              onTap: () => {
                showDialog(
                    context: context, builder: (_) => const OptionsDialog()),
              },
              child: SvgPicture.asset(
                'assets/icons/verticaldots.svg',
                height: 32,
                width: 32,
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
