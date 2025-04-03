import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: const Color(0xFF0E0B1F),
      labelBehavior: labelBehavior,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      indicatorColor: Colors.blue.withOpacity(0.3), // Efecto de difuminado azul
      destinations: const <NavigationDestination>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: '',
          
        ),
       
        
        NavigationDestination(
          selectedIcon: Icon(Icons.bookmark),
          icon: Icon(Icons.bookmark_border),
          label: '',
        ),
         NavigationDestination(
          selectedIcon: Icon(Icons.explore),
          icon: Icon(Icons.explore_outlined),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.book),
          icon: Icon(Icons.book_outlined),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.person),
          icon: Icon(Icons.person_outline),
          label: '',
        ),
      ],
    );
  }
}
