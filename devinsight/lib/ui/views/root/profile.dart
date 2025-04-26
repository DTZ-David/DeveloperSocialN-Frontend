import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:devinsight/ui/widgets/navProfile.dart';
import 'package:devinsight/ui/widgets/simplePostCard.dart';
import 'package:devinsight/ui/widgets/socialButtom.dart';
import 'package:devinsight/ui/widgets/socialFollowers.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                          "https://static.vecteezy.com/system/resources/thumbnails/002/960/590/small/abstract-watercolor-texture-wallpaper-background-free-vector.jpg"), // o NetworkImage()
                      fit: BoxFit.cover,
                    ),
                    color: AppColors.secondaryColors,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                // CircleAvatar sobresaliendo por debajo
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
          const SizedBox(height: 70), // espacio para el avatar y texto
          const Socialfollowers(),
          const SocialButton(),
          const Navprofile(),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SimplePostCard(
                    userName: 'Ssaylem Murillo',
                    sentAt: 'Hace 1 hora',
                    userIcon: 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                    description:
                        'Necesito 2 programadores urgentes para un proyecto de backend con FastAPI.\n\n#python #fastapi #programming #work #hectorsk4',
                    
                  ),
                  SizedBox(height: 10),
                  SimplePostCard(
                    userName: 'María Gómez',
                    sentAt: 'Hace 2 horas',
                    userIcon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PcqJxjZUZopdG2u3196bPgKzeHAbTj8b_Q&s',
                    description:
                        'Busco diseñador UX/UI para colaboración remota.\n\n#design #uxui #freelance',
                    
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
