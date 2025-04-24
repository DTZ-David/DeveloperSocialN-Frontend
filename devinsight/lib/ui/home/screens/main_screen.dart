import 'package:flutter/material.dart';
import 'package:devinsight/ui/home/widgets/navBar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: const Center(
        child: Text('Welcome to Main Screen'),
      ),
      bottomNavigationBar: const CustomNavbar(
        currentIndex: 0,
      ),
    );
  }
}
