import 'package:devinsight/ui/home/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/config/providers/conectionsProvider.dart';
import 'package:devinsight/config/providers/interaction_provider.dart';
import 'package:devinsight/config/providers/mediaProvider.dart';
import 'package:devinsight/config/providers/nav_profile_provider.dart';
import 'package:devinsight/config/providers/publications_provider.dart';
import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/home/widgets/interactionsCard.dart';
import 'package:devinsight/ui/home/widgets/mediaCard.dart';
import 'package:devinsight/ui/home/widgets/navProfile.dart';
import 'package:devinsight/ui/home/widgets/publicationsCard.dart';
import 'package:devinsight/ui/home/widgets/socialButtom.dart';
import 'package:devinsight/ui/home/widgets/socialFollowers.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _horizontalPadding = EdgeInsets.symmetric(horizontal: 20.0);

class Profile extends ConsumerWidget {
  final String bannerUrl;
  final String profileImageUrl;
  final bool showSocialButton;

  const Profile({
    super.key,
    this.bannerUrl =
        'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
    this.profileImageUrl =
        'https://static.vecteezy.com/system/resources/thumbnails/002/960/590/small/abstract-watercolor-texture-wallpaper-background-free-vector.jpg',
    required this.showSocialButton,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedProfileTabProvider);
    final interactions = ref.watch(interactionsProvider);
    final publications = ref.watch(myProfilePublicationsProvider('ChecoDev'));
    final connections = ref.watch(connectionsProvider);
    ref.watch(mediaProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.background,
        elevation: 0,
        onPressed: () => ref.read(appRouterProvider).go(AppRouter.message),
        child: SvgPicture.asset(
          'assets/icons/message_profile.svg',
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
          height: 25,
          width: 25,
        ),
      ),
      appBar: AppBar(
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
      ),
      backgroundColor: AppColors.thirdColors,
      body: CustomScrollView(
        slivers: [
          UserProfile(
            bannerUrl: bannerUrl,
            profileImageUrl: profileImageUrl,
            showSocialButton: showSocialButton,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
          if (showSocialButton) ...[
            const _PaddedWidget(child: Socialfollowers()),
            _PaddedWidget(child: SocialButton()),
          ],
          const _PaddedWidget(child: NavProfile()),
          const SliverToBoxAdapter(child: SizedBox(height: 1)),
          _buildTabContent(
              selectedTab, publications, interactions, connections),
        ],
      ),
    );
  }

  Widget _buildTabContent(
      int selectedTab, List publications, List interactions, List connections) {
    switch (selectedTab) {
      case 0:
        return _buildSliverList(
          publications,
          (data) => PublicationsCard(
            userName: data['user_name'],
            sentAt: data['sent_at'],
            userIcon: data['user_icon'],
            description: data['description'],
            code: data['code'],
            language: data['language'],
            tags: List<String>.from(data['tags']),
            reactions: const [],
          ),
        );
      case 1:
        return _buildSliverList(
          interactions,
          (data) => InteractionCard(
            tipo: data['tipo'],
            id: data['id'],
            mensaje: data['mensaje'],
          ),
        );
      case 2:
        return const SliverFillRemaining(child: UserList());
      case 3:
        return const MediaGallery();
      default:
        return const SliverToBoxAdapter();
    }
  }

  Widget _buildSliverList(
      List data, Widget Function(Map<String, dynamic>) itemBuilder) {
    return SliverPadding(
      padding: _horizontalPadding,
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: itemBuilder(data[index]),
          ),
          childCount: data.length,
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  final String bannerUrl;
  final String profileImageUrl;
  final bool showSocialButton;

  const UserProfile({
    super.key,
    required this.bannerUrl,
    required this.profileImageUrl,
    required this.showSocialButton,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: _horizontalPadding,
        child: SizedBox(
          width: double.infinity,
          height: 110,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(bannerUrl),
                    fit: BoxFit.cover,
                  ),
                  color: AppColors.secondaryColors,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                bottom: -40,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
              ),
              const Positioned(
                bottom: -70,
                child: Text(
                  'Ssaylem Murillo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaddedWidget extends StatelessWidget {
  final Widget child;

  const _PaddedWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: _horizontalPadding,
        child: child,
      ),
    );
  }
}
