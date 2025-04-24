import 'package:devinsight/ui/widgets/optionsDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PublicationHeader extends StatelessWidget {
  const PublicationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                child: SvgPicture.asset('assets/icons/rocket.svg', height: 30),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Flutter Code',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('Hoy a las 2 PM', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => const OptionsDialog(),
          ),
        ),
      ],
    );
  }
}
