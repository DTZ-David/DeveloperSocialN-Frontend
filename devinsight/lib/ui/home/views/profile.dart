import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/providers/comments_provider.dart';
import '../../../config/providers/connections_provider.dart';
import '../../../config/providers/mediaProvider.dart';
import '../../../config/providers/nav_profile_provider.dart';
import '../../../controller/profileFeedController.dart';
import '../../../ui/theme/app_colors.dart';
import 'package:devinsight/ui/home/widgets/navProfile.dart';
import 'package:devinsight/ui/home/widgets/socialButtom.dart';
import 'package:devinsight/ui/home/widgets/socialFollowers.dart';

import '../widgets/profile/message_button.dart';
import '../widgets/profile/padded_sliver.dart';
import '../widgets/profile/tab_content.dart';
import '../widgets/profile/user_profile.dart';

class Profile extends ConsumerWidget {
  final String bannerUrl;
  final String profileImageUrl;
  final bool showSocialButton;

  const Profile({
    super.key,
    this.bannerUrl =
        'https://img.freepik.com/premium-vector/saturn-planet-watercolor-hand-drawn-vertical-banner_9493-92159.jpg',
    this.profileImageUrl = 'https://static.vecteezy.com/...jpg',
    required this.showSocialButton,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedProfileTabProvider);
    final feedState = ref.watch(profileFeedControllerProvider);
    final interactionsState = ref.watch(userInteractionsProvider);
    final connectionsState = ref.watch(connectionsProvider);
    ref.watch(mediaProvider);

    return Scaffold(
      floatingActionButton: const MessageButton(),
      appBar: _buildAppBar(),
      backgroundColor: AppColors.thirdColors,
      body: CustomScrollView(
        slivers: [
          UserProfile(
            bannerUrl: bannerUrl,
            profileImageUrl: profileImageUrl,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
          if (showSocialButton) ...[
            const PaddedSliver(child: Socialfollowers()),
            PaddedSliver(child: SocialButton()),
          ],
          const PaddedSliver(child: NavProfile()),
          feedState.when(
            data: (posts) => interactionsState.when(
              data: (comments) => connectionsState.when(
                data: (connections) => buildTabContent(selectedTab, posts, comments, connections),
                loading: () => const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, _) => SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('Error al cargar conexiones: $error'),
                  ),
                ),
              ),
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, _) => SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('Error al cargar interacciones: $error'),
                ),
              ),
            ),
            loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, _) => SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Error al cargar publicaciones: $error'),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      shadowColor: AppColors.tertiaryColors,
      elevation: 0.2,
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
