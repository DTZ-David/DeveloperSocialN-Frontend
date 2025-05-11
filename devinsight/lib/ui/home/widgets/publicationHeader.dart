import 'package:devinsight/ui/home/widgets/optionsDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

String formatSentAt(String sentAtString) {
  final dateTime = DateTime.parse(sentAtString).toLocal(); // Convierte a local
  final now = DateTime.now();

  final difference = now.difference(dateTime);

  if (difference.inHours < 24) {
    // Si es hoy, muestra la hora con AM/PM
    return DateFormat('hh:mm a').format(dateTime);
  } else {
    // Si no, usa timeago
    return timeago.format(dateTime, locale: 'es');
  }
}

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
                backgroundImage: NetworkImage(userIcon),
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
                    formatSentAt(sentAt),
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
