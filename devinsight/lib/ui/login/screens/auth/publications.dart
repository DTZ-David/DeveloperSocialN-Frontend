import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/login/widgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Publications extends ConsumerWidget {
  const Publications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Publicaciones'),
        backgroundColor: const Color(0xFF0E0B1F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref .read(appRouterProvider).go(AppRouter.home);
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Contenido de Publicaciones',
          style: TextStyle(fontSize: 24),
        ),
      ),
        bottomNavigationBar: const CustomNavbar(),
    );
  }
}