import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white54,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        prefixIcon: const Icon(Icons.search, color: Colors.white54, size: 20),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1.2),
        ),
      ),
      cursorColor: Colors.blueAccent,
      onChanged: (value) =>
          ref.read(searchQueryProvider.notifier).state = value,
    );
  }
}
