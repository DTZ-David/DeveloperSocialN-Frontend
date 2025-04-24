import 'package:devinsight/ui/home/widgets/navBar.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomNavbar(
        currentIndex: 4,
      ),
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
