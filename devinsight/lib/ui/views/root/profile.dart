import 'package:devinsight/config/providers/publications_provider.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:devinsight/ui/widgets/navProfile.dart';
import 'package:devinsight/ui/widgets/publicationsCard.dart';
import 'package:devinsight/ui/widgets/socialButtom.dart';
import 'package:devinsight/ui/widgets/socialFollowers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // <- Asegúrate de importar esto

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publications = ref.watch(myProfilePublicationsProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(
            width: 500,
            height: 100,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://static.vecteezy.com/system/resources/thumbnails/002/960/590/small/abstract-watercolor-texture-wallpaper-background-free-vector.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: AppColors.secondaryColors,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const Positioned(
                  bottom: -40,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg"),
                  ),
                ),
                const Positioned(
                  bottom: -60,
                  child: Text(
                    'Ssaylem Murillo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: Socialfollowers()),
                const SliverToBoxAdapter(child: SocialButton()),
                const SliverToBoxAdapter(child: Navprofile()),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 10), // Adjust spacing as needed
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final data = publications[index];
                      return Padding(
                        // Add padding around each card if needed
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: PublicationsCard(
                          userName: data['user_name'],
                          sentAt: data['sent_at'],
                          userIcon: data['user_icon'],
                          description: data['description'],
                          code: data['code'],
                          language: data['language'],
                          tags: List<String>.from(data['tags']),
                          // Ensure you have 'likes' and 'comments' in your data
                          reactions: [],
                          // Your options dialog logic here
                          // Pass reactions if needed
                        ),
                      );
                    },
                    childCount: publications.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
