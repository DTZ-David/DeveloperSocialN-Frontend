import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:devinsight/config/routers/app_router.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _currentIndex = 0;

  final List<String> _routes = [
    AppRouter.home,
    AppRouter.explorer,
    '', // botón central no navega
    AppRouter.publications,
    AppRouter.onboard3,
  ];

  void _onTabTapped(int index) {
    if (index == 2) {
      print("Botón central presionado");
    } else {
      setState(() {
        _currentIndex = index;
      });
      context.go(_routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavSvg('assets/icons/navbar/homep.svg', 0),
              _buildNavSvg('assets/icons/navbar/savep.svg', 1),
              const SizedBox(width: 80), // espacio para el botón central
              _buildNavSvg('assets/icons/navbar/searchp.svg', 3),
              _buildNavSvg('assets/icons/navbar/userp.svg', 4),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 20,
        child: GestureDetector(
          onTap: () => _onTabTapped(2),
          child: Container(
            height: 56,
            width: 120,
            decoration: BoxDecoration(
              color: const Color(0xFF1ECAFF),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/navbar/plus.svg',
                height: 32,
                width: 32,
                // ignore: deprecated_member_use
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _buildNavSvg(String assetPath, int index) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: SvgPicture.asset(
        assetPath,
        height: 28,
        width: 28,
        // ignore: deprecated_member_use
        color: isSelected ? const Color(0xFF1ABCFE) : Colors.white,
      ),
    );
  }
}
