import 'package:flutter/material.dart';

class PaddedSliver extends StatelessWidget {
  final Widget child;
  const PaddedSliver({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: child,
      ),
    );
  }
}
