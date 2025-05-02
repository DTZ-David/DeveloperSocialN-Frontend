import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onSelected;

  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.icon,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: Icon(
        icon,
        color: AppColors.accent,
        size: 18,
      ),
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelected(),
      labelStyle: const TextStyle(
          color: Colors.white,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold),
      backgroundColor: Colors.grey[850],
      selectedColor: AppColors.accent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: const BorderSide(color: Colors.transparent),
      ),
    );
  }
}
