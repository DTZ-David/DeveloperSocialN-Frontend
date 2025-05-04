import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/providers/post_provider.dart';

class PostFileList extends ConsumerWidget {
  final List<File> files;

  const PostFileList({super.key, required this.files});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (files.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Archivos:',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ...files.map((file) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              file.path.split('/').last,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.close, size: 16, color: Colors.white),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 32,
                minHeight: 32,
              ),
              onPressed: () {
                ref.read(postProvider.notifier).removeFile(file);
              },
            ),
          );
        }),
      ],
    );
  }
}
