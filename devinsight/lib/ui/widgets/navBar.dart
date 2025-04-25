import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/config/providers/navbar_index_provider.dart';

class CustomNavbar extends ConsumerWidget {
  const CustomNavbar({super.key});

  void _onTap(WidgetRef ref, int index) {
    ref.read(navbarIndexProvider.notifier).state = index;
    if (index == 2) {
      print("Botón central presionado");
      // Aquí puedes abrir modal o lo que desees
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navbarIndexProvider);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          color: const Color(0xFF000000),
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _navItem(ref, 'assets/icons/navbar/homep.svg', 'Inicio', 0,
                    currentIndex),
                _navItem(ref, 'assets/icons/navbar/savep.svg', 'Guardados', 1,
                    currentIndex),
                const SizedBox(width: 80), // espacio para botón central
                _navItem(ref, 'assets/icons/navbar/searchp.svg', 'Explorar', 3,
                    currentIndex),
                _navItem(ref, 'assets/icons/navbar/userp.svg', 'Perfil', 4,
                    currentIndex),
              ],
            ),
          ),
        ),
        // Botón central especial
        Positioned(
          bottom: 20,
          top: 10,
          child: GestureDetector(
            onTap: () => _onTap(ref, 2),
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
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _navItem(WidgetRef ref, String iconPath, String label, int index,
      int currentIndex) {
    final isSelected = index == currentIndex;
    return GestureDetector(
      onTap: () => _onTap(ref, index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 32,
            width: 32,
            color: isSelected ? const Color(0xFF1ABCFE) : Colors.white,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF1ABCFE) : Colors.white,
              fontSize: 10,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
