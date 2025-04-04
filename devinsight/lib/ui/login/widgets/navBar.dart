import 'package:devinsight/config/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:devinsight/config/routers/app_router.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;
  //orden de las rutas de izquierda a derecha
  final List<String> _routes = [
    AppRouter.home,
    AppRouter.onboard1,
    AppRouter.onboard2,
    AppRouter.registerUser,
    AppRouter.onboard3,
    
  ];

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
        context.go(_routes[index]); 
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
