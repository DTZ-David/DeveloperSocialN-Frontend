import 'package:devinsight/config/providers/conectionsProvider.dart';
import 'package:devinsight/config/providers/interaction_provider.dart';
import 'package:devinsight/config/providers/mediaProvider.dart';
import 'package:devinsight/config/providers/nav_profile_provider.dart';
import 'package:devinsight/config/providers/publications_provider.dart';
import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/home/widgets/conectionsCard.dart';
import 'package:devinsight/ui/home/widgets/interactionsCard.dart';
import 'package:devinsight/ui/home/widgets/mediaCard.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:devinsight/ui/home/widgets/navProfile.dart';
import 'package:devinsight/ui/home/widgets/publicationsCard.dart';
import 'package:devinsight/ui/home/widgets/socialButtom.dart';
import 'package:devinsight/ui/home/widgets/socialFollowers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  final String bannerUrl;
  final String profileImageUrl;
  final bool showSocialButton;

  // Recibimos los parámetros a través del constructor
  const Profile({
    super.key,
    this.bannerUrl = 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
    this.profileImageUrl = 'https://static.vecteezy.com/system/resources/thumbnails/002/960/590/small/abstract-watercolor-texture-wallpaper-background-free-vector.jpg',
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: AppColors.primaryColors,
        onPressed: () {
          ref.read(appRouterProvider).go(AppRouter.message);
        },
        child: const Icon(Icons.message_outlined, color: Colors.white),
      ),
      appBar: AppBar(
        shadowColor: AppColors.tertiaryColors,
        elevation: 0.2,
        backgroundColor: AppColors.primaryColors,
        title: const Row(
          children: [
            SizedBox(width: 16),
            Text(
              "Perfil",
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
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Socialfollowers(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SocialButton(),
              ),
            ),
          ],
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: NavProfile(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),

          // Contenido dinámico según la pestaña seleccionada
          if (selectedTab == 0)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final data = publications[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: PublicationsCard(
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
                  },
                  childCount: publications.length,
                ),
              ),
            )
          else if (selectedTab == 1)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final data = interactions[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: InteractionCard(
                        tipo: data['tipo'],
                        id: data['id'],
                        mensaje: data['mensaje'],
                      ),
                    );
                  },
                  childCount: interactions.length,
                ),
              ),
            )
          else if (selectedTab == 2)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final data = connections[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: CustomCard(
                        title: data['title'],
                        subtitle: data['subtitle'],
                        iconAsset: data['iconAsset'],
                      ),
                    );
                  },
                  childCount: connections.length,
                ),
              ),
            )
          else if (selectedTab == 3)
            const MediaGallery()
        ],
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  final String bannerUrl;
  final String profileImageUrl;
  final bool showSocialButton;

  // Recibimos los parámetros a través del constructor
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    image: NetworkImage(bannerUrl), // Usamos el parámetro
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
                  backgroundImage: NetworkImage(profileImageUrl), // Usamos el parámetro
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
