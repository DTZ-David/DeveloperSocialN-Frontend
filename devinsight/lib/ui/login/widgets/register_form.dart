// register_form.dart
import 'package:devinsight/ui/login/widgets/customButton.dart';
import 'package:devinsight/ui/login/widgets/customTextField.dart';
import 'package:devinsight/ui/login/widgets/modern_snackbar.dart';
import 'package:devinsight/ui/login/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/providers/register_provider.dart';
import '../../../config/routers/app_router.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Column(
      children: [
        CustomTextField(
          label: "Usuario",
          icon: const SvgIcon(
            assetName: 'assets/icons/login_user.svg',
            color: Colors.white70,
            height: 14,
            width: 14,
          ),
          controller: usernameController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Correo",
          icon: const SvgIcon(
            assetName: 'assets/icons/login_mail.svg',
            color: Colors.white70,
            height: 14,
            width: 14,
          ),
          controller: emailController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          label: "Contraseña",
          icon: const SvgIcon(
            assetName: 'assets/icons/login_lock.svg',
            color: Colors.white70,
            height: 14,
            width: 14,
          ),
          isPassword: true,
          controller: passwordController,
        ),
        const SizedBox(height: 40),
        CustomButton(
          text: "Registrarse",
          onPressed: () {
            final username = usernameController.text;
            final email = emailController.text;
            final password = passwordController.text;

            if (username.isEmpty || email.isEmpty || password.isEmpty) {
              ModernSnackBar.show(
                  context, 'Completa todos los campos antes de continuar',
                  isError: true);
              return;
            }

            ref.read(registerProvider.notifier).setUsername(username);
            ref.read(registerProvider.notifier).setEmail(email);
            ref.read(registerProvider.notifier).setPassword(password);

            ref.read(appRouterProvider).go(AppRouter.onboard1);
          },
        ),
      ],
    );
  }
}
