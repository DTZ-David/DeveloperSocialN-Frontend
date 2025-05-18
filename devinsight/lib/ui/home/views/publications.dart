import 'package:devinsight/config/providers/pub_refactor_provider.dart';
import 'package:devinsight/ui/home/widgets/publicationsCard.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Publications extends ConsumerWidget {
  const Publications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postRefactorProvider);

    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.tertiaryColors,
        elevation: 0.2,
        backgroundColor: AppColors.primaryColors,
        title: const Row(
          children: [
            SizedBox(width: 16),
            Text(
              "Favoritos",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
        actions: const [
          SizedBox(width: 16),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 21, 20, 20),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref.read(postRefactorProvider.notifier).loadPosts();

                  // SnackBar para confirmar la actualización
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Feed actualizado'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: posts.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator()) // o un mensaje
                    : ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          print(post);
                          return Column(
                            children: [
                              PublicationsCard(
                                  post: post), // Ya usa PostRefactor
                              const SizedBox(height: 4),
                            ],
                          );
                        },
                      ),
              ))),
    );
  }
}
