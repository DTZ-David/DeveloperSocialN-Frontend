import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/routers/app_router.dart';
import '../../../theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageButton extends ConsumerWidget {
  const MessageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: AppColors.primaryColors,
      elevation: 0,
      onPressed: () => ref.read(appRouterProvider).go(AppRouter.message),
      child: SvgPicture.asset(
        'assets/icons/message_profile.svg',
        width: 24,
        height: 24,
      ),
    );
  }
}
