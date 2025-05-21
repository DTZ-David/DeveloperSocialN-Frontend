import 'package:flutter/material.dart';

class OptionsDialog extends StatelessWidget {
  const OptionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // You can define your main color scheme here or get it from your theme
    const Color backgroundColor = Colors.black;
    const Color primaryTextColor = Colors.white;
    const Color dividerColor = Colors.white24;
    const Color iconColor = Colors.white;
    const Color saveIconColor = Color(0xFF4F8EFF); // Custom blue
    const Color reportIconColor = Color(0xFFFF5A5F); // Custom red

    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      actionsPadding: const EdgeInsets.only(right: 12, bottom: 10),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Publicación',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 6),
          Divider(color: dividerColor, thickness: 1),
        ],
      ),
      actions: [
        TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close, color: iconColor, size: 20),
          label: const Text(
            'Cerrar',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: primaryTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          style: TextButton.styleFrom(
            foregroundColor: primaryTextColor,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opción 1
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.save, color: saveIconColor),
                  const SizedBox(width: 14),
                  const Text(
                    'Guardar publicación',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Opción 2
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.report_problem_sharp,
                      color: reportIconColor),
                  const SizedBox(width: 14),
                  const Text(
                    'Reportar publicación',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
