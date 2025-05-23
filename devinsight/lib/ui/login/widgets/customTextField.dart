import 'package:flutter/material.dart';
import 'package:devinsight/ui/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final Widget icon;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    this.isPassword = false,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.thirdColors,
          borderRadius: BorderRadius.circular(100),
        ),
        child: TextField(
          controller: widget.controller,
          obscureText: widget.isPassword ? !_isPasswordVisible : false,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: widget.label,
            hintStyle: const TextStyle(
              color: Colors.white70,
              fontFamily: "Montserrat",
              fontSize: 14,
            ),
            filled: true,
            fillColor: Colors.transparent,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 8),
              child: widget.icon, // CAMBIADO: renderiza el widget SvgIcon
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    )
                  : null,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
