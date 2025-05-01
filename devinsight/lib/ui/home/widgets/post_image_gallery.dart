import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/config/providers/post_state.dart';

class PostImageGallery extends ConsumerWidget {
  final List<File> images;

  const PostImageGallery({super.key, required this.images});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (images.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          children: images.map((img) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
              child: Stack(
                alignment: Alignment.topRight,
                fit: StackFit.loose,
                children: [
                  ClipRRect(
                    child: Image.file(
                      img,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () =>
                          ref.read(postProvider.notifier).removeImage(img),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.red,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.close,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
