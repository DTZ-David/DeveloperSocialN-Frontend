import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: 500,
        height: 100, // espacio suficiente para el container + mitad del avatar
        child: Stack(
          clipBehavior: Clip.none, // Permite que se vea el desbordamiento
          alignment: Alignment.bottomCenter,
          children: [
            // Container principal
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://static.vecteezy.com/system/resources/thumbnails/002/960/590/small/abstract-watercolor-texture-wallpaper-background-free-vector.jpg"), // o NetworkImage()
                  fit: BoxFit.cover, // ajusta la imagen
                ),
                color: AppColors.secondaryColors,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // CircleAvatar sobresaliendo por debajo
            const Positioned(
              bottom: -40,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg"),
              ),
            ),
            const Positioned(
              bottom: -70, // un poco más abajo que el avatar
              child: Text(
                'Ssaylem Murillo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
