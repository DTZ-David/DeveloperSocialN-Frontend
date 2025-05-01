import 'dart:ffi';

import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? iconAsset; // Puede ser null si usamos un Icon en su lugar

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    Widget leadingIcon;

    if (iconAsset != null) {
      if (iconAsset!.endsWith('.svg')) {
        leadingIcon = SvgPicture.asset(
          iconAsset!,
          width: 24,
          height: 24,
        );
      } else if (iconAsset!.endsWith('.png')) {
        leadingIcon = Image.asset(
          iconAsset!,
          width: 30,
          height: 30,
        );
      } else {
        leadingIcon =
            const Icon(Icons.info_outline, size: 24, color: Colors.blue);
      }
    } else {
      leadingIcon =
          const Icon(Icons.info_outline, size: 24, color: Colors.blue);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leadingIcon,
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ),
              //const SizedBox(width: 8),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.tertiaryColors,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/saturn.svg', 
                    width: 20,
                    height: 20,
                    
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 184, 57, 57),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/saturn.svg', 
                    width: 20,
                    height: 20,
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
