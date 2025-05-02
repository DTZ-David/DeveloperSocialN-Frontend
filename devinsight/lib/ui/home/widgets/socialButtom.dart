import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialButton extends ConsumerWidget {
  SocialButton({super.key});
  final isFollowingProvider = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFollowing = ref.watch(isFollowingProvider);
    final isFollowingNotifier = ref.read(isFollowingProvider.notifier);

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Botón de Seguir / Seguido
          ElevatedButton.icon(
            onPressed: () {
              isFollowingNotifier.state = !isFollowing;
            },
            icon: Icon(
              isFollowing ? Icons.check : Icons.person_add,
              color: Colors.white,
              size: 16,
            ),
            label: Text(
              isFollowing ? 'Siguiendo' : 'Seguir',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 40),
              backgroundColor: isFollowing ? Colors.grey : Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          // Botón de Mensaje
          ElevatedButton(
            onPressed: () {
              ref.read(appRouterProvider).go(AppRouter.message);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 40),
              backgroundColor: AppColors.secondaryColors,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Mensaje',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Botón de Seguir / Seguido
        ],
      ),
    );
  }
}
