import 'package:devinsight/config/providers/mediaProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MediaGallery extends ConsumerWidget {
  const MediaGallery({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaList = ref.watch(mediaProvider);

    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childCount: mediaList.length,
      itemBuilder: (context, index) {
        final imageUrl = mediaList[index]['imageURL'] as String;
        final randomHeight = (index.isEven) ? 200.0 : 300.0;

        return GestureDetector(
          onTap: () => _showImageDialog(context, imageUrl),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: randomHeight,
            ),
          ),
        );
      },
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.black,
        insetPadding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            InteractiveViewer(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
