import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/home/widgets/a.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod

class Navprofile extends ConsumerStatefulWidget { // Change to ConsumerStatefulWidget
  const Navprofile({super.key});

  @override
  _NavprofileState createState() => _NavprofileState();
}

class _NavprofileState extends ConsumerState<Navprofile> { // Change to ConsumerState
  int _selectedIndex = 0; // Variable para controlar qué botón está seleccionado

  // Función para actualizar el índice seleccionado
  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          TextButton.icon(
            onPressed: () => _onButtonPressed(0),
            icon: Icon(
              Icons.post_add,
              color: _selectedIndex == 0
                  ? AppColors.components
                  : Colors.white,
              size: 20,
            ),
            label: Text(
              "Posts",
              style: TextStyle(
                fontSize: 10,
                color: _selectedIndex == 0
                    ? AppColors.components
                    : Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              minimumSize: const Size(60, 50),
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent, // Sin fondo
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              //ref.read(appRouterProvider).go(AppRouter.a);
            },
            child: TextButton.icon(
              onPressed: () => _onButtonPressed(1),
              icon: Icon(
                Icons.touch_app,
                color: _selectedIndex == 1
                    ? AppColors.components
                    : Colors.white,
                size: 18,
              ),
              label: Text(
                "Interacciones",
                style: TextStyle(
                  fontSize: 10,
                  color: _selectedIndex == 1
                      ? AppColors.components
                      : Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                minimumSize: const Size(60, 50),
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent, // Sin fondo
              ),
            ),
          ),
          const SizedBox(width: 5),
          TextButton.icon(
            onPressed: () => _onButtonPressed(2),
            icon: Icon(
              Icons.network_ping,
              color: _selectedIndex == 2
                  ? AppColors.components
                  : Colors.white,
              size: 18,
            ),
            label: Text(
              "Conexiones",
              style: TextStyle(
                fontSize: 10,
                color: _selectedIndex == 2
                    ? AppColors.components
                    : Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              minimumSize: const Size(60, 50),
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent, // Sin fondo
            ),
          ),
          const SizedBox(width: 5),
          TextButton.icon(
            onPressed: () => _onButtonPressed(3),
            icon: Icon(
              Icons.videocam_outlined,
              color: _selectedIndex == 3
                  ? AppColors.components
                  : Colors.white,
              size: 18,
            ),
            label: Text(
              "Media",
              style: TextStyle(
                fontSize: 10,
                color: _selectedIndex == 3
                    ? AppColors.components
                    : Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              minimumSize: const Size(60, 50),
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent, // Sin fondo
            ),
          ),
        ],
      ),
    );
  }
}
