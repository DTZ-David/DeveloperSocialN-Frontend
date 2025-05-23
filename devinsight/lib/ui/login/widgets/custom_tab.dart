import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final bool isLogin;
  final Function(bool) onChanged;

  const CustomTab({required this.isLogin, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Row(
        children: [
          _buildTab(context, "Iniciar sesión", true),
          _buildTab(context, "Registrarse", false),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, String label, bool selected) {
    final isSelected = selected == isLogin;
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(selected),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.accent : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.accent : Colors.white,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              fontFamily: "Montserrat",
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
