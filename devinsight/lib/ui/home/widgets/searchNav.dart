import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MinimalSearchField extends ConsumerWidget {
  final String hintText;
  final StateProvider<String> searchQueryProvider;

  const MinimalSearchField({
    super.key,
    required this.searchQueryProvider,
    this.hintText = 'Buscar...',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white54,
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            'assets/icons/search-line.svg',
            color: const Color.fromARGB(136, 224, 220, 220),
          ),
        ),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.2),
        ),
      ),
      cursorColor: Colors.blueAccent,
      onChanged: (value) =>
          ref.read(searchQueryProvider.notifier).state = value,
    );
  }
}
