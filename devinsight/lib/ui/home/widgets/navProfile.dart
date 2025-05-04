import 'package:devinsight/config/providers/nav_profile_provider.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavProfile extends ConsumerStatefulWidget {
  const NavProfile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavProfileState createState() => _NavProfileState();
}

class _NavProfileState extends ConsumerState<NavProfile> {
  int _selectedIndex = 0;

  void _onButtonPressed(int index) {
  setState(() {
    _selectedIndex = index;
  });
  ref.read(selectedProfileTabProvider.notifier).state = index;
}

  @override
  Widget build(BuildContext context) {
    final List<_NavButtonData> buttons = [
      _NavButtonData("Posts", 'assets/icons/post_profile.svg'),
      _NavButtonData("Interacciones", 'assets/icons/interactions_profile.svg'),
      _NavButtonData("Conexiones", 'assets/icons/connections_profile.svg'),
      //_NavButtonData("Media", 'assets/icons/video_profile.svg'),
    ];

    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(buttons.length, (index) {
          final button = buttons[index];
          return _NavButton(
            label: button.label,
            iconPath: button.iconPath,
            isSelected: _selectedIndex == index,
            onPressed: () => _onButtonPressed(index),
          );
        }),
      ),
    );
  }
}

class _NavButtonData {
  final String label;
  final String iconPath;

  _NavButtonData(this.label, this.iconPath);
}

class _NavButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onPressed;

  const _NavButton({
    required this.label,
    required this.iconPath,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          iconPath,
          height: 20,
          width: 20,
          color: isSelected ? AppColors.accent : Colors.white,
        ),
        label: Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isSelected ? AppColors.accent : Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextButton.styleFrom(
          minimumSize: const Size(60, 50),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
