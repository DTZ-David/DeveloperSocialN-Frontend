import 'package:devinsight/config/providers/publications_provider.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:devinsight/ui/home/widgets/navProfile.dart';
import 'package:devinsight/ui/home/widgets/publicationsCard.dart';
import 'package:devinsight/ui/home/widgets/socialButtom.dart';
import 'package:devinsight/ui/home/widgets/socialFollowers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publications = ref.watch(myProfilePublicationsProvider);

    return CustomScrollView(
      slivers: [
        // --- Top Banner and Avatar Section ---
        const UserProfile(),

        const SliverToBoxAdapter(
          child: SizedBox(height: 80),
        ),

        // --- Social Followers, Buttons, Nav---
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
          child: NavProfile(),
        )),

        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),

        // --- Publications List (scrollable) ---
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

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: double.infinity, // Make width responsive
          height: 150, // Adjusted height for better spacing
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 100,
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
                bottom: -70,
                child: Text(
                  'Ssaylem Murillo',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
