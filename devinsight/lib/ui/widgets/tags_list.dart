// lib/ui/widgets/tag_list.dart
import 'package:flutter/material.dart';

class TagList extends StatefulWidget {
  final List<String> tags;
  final void Function(String) onTagAdded;

  const TagList({
    super.key,
    required this.tags,
    required this.onTagAdded,
  });

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  final TextEditingController _tagController = TextEditingController();

  void _handleSubmitted(String value) {
    final trimmed = value.trim();
    if (trimmed.isNotEmpty && !widget.tags.contains("#$trimmed")) {
      widget.onTagAdded("#$trimmed"); // Siempre agregar el hashtag
    }
    _tagController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        const Text(
          'Tags:',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _tagController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Agrega un tag y presiona enter",
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: const Color.fromARGB(255, 97, 98, 98).withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          onSubmitted: _handleSubmitted,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: widget.tags.map((tag) {
            return Chip(
              label: Text(
                tag,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: const Color(0xFF1ABCFE),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            );
          }).toList(),
        ),
      ],
    );
  }
}
