import 'package:devinsight/controller/profileFeedController.dart';
import 'package:devinsight/models/user/user.dart';
import 'package:devinsight/ui/home/widgets/publicationsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/app_colors.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/user_bio.dart';

class UsersProfileView extends ConsumerWidget {
  final User user;

  const UsersProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedState = ref.watch(profileFeedControllerProvider);

    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: ProfileHeader(user: user)),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: UserBio(bio: user.bio ?? "Sin biografía")),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // Publicaciones:
          feedState.when(
            data: (posts) {
              if (posts.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: Text("Sin publicaciones")),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PublicationsCard(post: posts[index]),
                  childCount: posts.length,
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, _) => SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Error al cargar publicaciones: $error'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColors,
      title: const Text(
        "Perfil",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
