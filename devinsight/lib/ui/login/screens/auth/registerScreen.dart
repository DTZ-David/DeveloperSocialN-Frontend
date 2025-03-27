import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/routers/app_router.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/socialButton.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.grey.shade800, Colors.black],
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/saturn.svg',
                                  height: 240,
                                  width: 240,
                                  color: const Color(0xFF1ABCFE),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  "DevInsight",
                                  style: TextStyle(
                                    color: Color(0xFF1ABCFE),
                                    fontSize: 32,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CustomTextField(
                                  label: "Usuario", icon: Icons.person),
                              const SizedBox(height: 20),
                              const CustomTextField(
                                  label: "Correo", icon: Icons.email),
                              const SizedBox(height: 20),
                              const CustomTextField(
                                  label: "Contraseña",
                                  icon: Icons.lock,
                                  isPassword: true),
                              const SizedBox(height: 40),
                              CustomButton(
                                text: "Registrarse",
                                onPressed: () {
                                  ref
                                      .read(appRouterProvider)
                                      .go(AppRouter.onboard1);
                                },
                              ),
                              const SizedBox(height: 30),
                              GestureDetector(
                                onTap: () {
                                  ref
                                      .read(appRouterProvider)
                                      .go(AppRouter.login);
                                },
                                child: const Text(
                                  "¿Ya tienes una cuenta? Inicia sesión",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
