import 'package:devinsight/config/providers/publications_provider.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:devinsight/ui/home/widgets/navProfile.dart';
import 'package:devinsight/ui/home/widgets/publicationsCard.dart';
import 'package:devinsight/ui/home/widgets/socialButtom.dart';
import 'package:devinsight/ui/home/widgets/socialFollowers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Import if you want to hide the scrollbar
// import 'package:devinsight/ui/utils/no_scrollbar_behavior.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publications = ref.watch(myProfilePublicationsProvider);
    // Replace Padding and Column with CustomScrollView
    return CustomScrollView(
      slivers: [
        // --- Top Banner and Avatar Section (now scrollable) ---
        SliverToBoxAdapter(
          child: Padding(
            // Apply horizontal padding here
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: 500, // Consider making width responsive
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
                      backgroundImage: NetworkImage(""),
                    ),
                  ),
                  const Positioned(
                    bottom: -60,
                    child: Text(
                      'Ssaylem Murillo',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // --- Spacing below Avatar (now scrollable) ---
        const SliverToBoxAdapter(
          child: SizedBox(height: 70),
        ),

        // --- Social Followers, Buttons, Nav (now scrollable) ---
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Socialfollowers(),
        )),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SocialButton(),
        )),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Navprofile(),
        )),

        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),

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
                    reactions: const [], // Pass actual reactions
                    // Add onOptionsPressed if needed
                  ),
                );
              },
              childCount: publications.length,
            ),
          ),
        ),
      ],
    );
  }
}
