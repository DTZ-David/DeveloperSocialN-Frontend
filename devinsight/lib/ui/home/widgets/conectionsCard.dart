import 'package:devinsight/ui/home/views/profile.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? iconAsset;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconAsset,
  });

  Widget _buildLeadingIcon() {
    if (iconAsset == null) {
      return const Icon(Icons.info_outline, size: 24, color: Colors.blue);
    }

    if (iconAsset!.endsWith('.svg')) {
      return SvgPicture.asset(iconAsset!, width: 24, height: 24);
    } else if (iconAsset!.endsWith('.png')) {
      return Image.asset(iconAsset!, width: 30, height: 30);
    } else {
      return const Icon(Icons.info_outline, size: 24, color: Colors.blue);
    }
  }

  Widget _buildIconContainer(String assetPath, Color backgroundColor) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: SvgPicture.asset(assetPath, width: 20, height: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLeadingIcon(),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
                _buildIconContainer(
                  'assets/icons/user_add_profile.svg',
                  AppColors.accent,
                ),
                const SizedBox(width: 10),
                _buildIconContainer(
                  'assets/icons/message_profile.svg',
                  AppColors.secondaryColors,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
