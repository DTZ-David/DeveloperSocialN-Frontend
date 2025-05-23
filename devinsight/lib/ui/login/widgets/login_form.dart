// login_form.dart
import 'package:devinsight/ui/login/widgets/customButton.dart';
import 'package:devinsight/ui/login/widgets/customTextField.dart';
import 'package:devinsight/ui/login/widgets/modern_snackbar.dart';
import 'package:devinsight/ui/login/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../controller/feedController.dart';
import '../../../controller/loginController.dart';
import '../../../config/routers/app_router.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = TextEditingController();
    final passwordController = TextEditingController();

    return Column(
      children: [
        CustomTextField(
          label: "Usuario",
          icon: const SvgIcon(
            assetName: 'assets/icons/login_user.svg',
            color: Colors.white70,
            height: 8,
            width: 8,
          ),
          controller: userController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Contraseña",
          icon: const SvgIcon(
            assetName: 'assets/icons/login_lock.svg',
            color: Colors.white70,
            height: 8,
            width: 8,
          ),
          isPassword: true,
          controller: passwordController,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 8, bottom: 8),
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "¿Olvidaste tu contraseña?",
                style: TextStyle(
                  color: Color(0xFF1ABCFE),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        CustomButton(
          text: "Iniciar Sesión",
          onPressed: () async {
            final username = userController.text;
            final password = passwordController.text;

            if (username.isEmpty || password.isEmpty) {
              ModernSnackBar.show(
                  context, 'Completa todos los campos antes de continuar',
                  isError: true);
              return;
            }

            final controller = ref.read(loginControllerProvider);
            final success = await controller.login(username, password);

            if (success) {
              ref.read(feedControllerProvider.notifier).loadFeed();
              ref.read(appRouterProvider).go(AppRouter.initial);
            } else {
              ModernSnackBar.show(context, 'No fue posible iniciar sesión',
                  isError: true);
            }
          },
        ),
      ],
    );
  }
}
