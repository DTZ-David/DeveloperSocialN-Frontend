import 'package:devinsight/config/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavbar extends StatefulWidget {
  final int currentIndex;

  const CustomNavbar({super.key, required this.currentIndex});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  late int currentPageIndex;

  final List<String> _routes = [
    AppRouter.home, //home
    AppRouter.publications, //publicationsFavorites
    AppRouter.explorer, //explorer
    AppRouter.publications, //home
    AppRouter.profile,
  ];

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: const Color(0xFF0E0B1F),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
          print(currentPageIndex);
        });
        context.go(_routes[index]);
      },
      indicatorColor: Colors.blue.withOpacity(0.3),
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
