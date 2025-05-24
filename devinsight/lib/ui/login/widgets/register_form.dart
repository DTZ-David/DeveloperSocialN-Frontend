import 'package:devinsight/ui/login/widgets/customButton.dart';
import 'package:devinsight/ui/login/widgets/customTextField.dart';
import 'package:devinsight/ui/login/widgets/modern_snackbar.dart';
import 'package:devinsight/ui/login/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/providers/register_provider.dart';
import '../../../config/routers/app_router.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm>
    with SingleTickerProviderStateMixin {
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
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

              if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                  .hasMatch(email)) {
                ModernSnackBar.show(
                    context, 'El formato utilizado en el correo no es valido',
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
      ),
    );
  }
}
