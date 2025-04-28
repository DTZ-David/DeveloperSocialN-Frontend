import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/routers/app_router.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import '../../../config/providers/register_provider.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Controladores para los campos de texto
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 20, 6, 48), Color.fromARGB(255, 4, 1, 9)],
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
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextField(
                                label: "Usuario",
                                icon: Icons.person,
                                controller: usernameController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                label: "Correo",
                                icon: Icons.email,
                                controller: emailController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                label: "Contraseña",
                                icon: Icons.lock,
                                isPassword: true,
                                controller: passwordController,
                              ),
                              const SizedBox(height: 40),
                              CustomButton(
                                text: "Registrarse",
                                onPressed: () {
                                  // Obtener los valores de los controladores
                                  final username = usernameController.text;
                                  final email = emailController.text;
                                  final password = passwordController.text;

                                  if (username.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Por favor ingresa un nombre de usuario')),
                                    );
                                    return;
                                  }
                                  if (email.isEmpty ||
                                      !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                          .hasMatch(email)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Por favor ingresa un correo electrónico válido')),
                                    );
                                    return;
                                  }
                                  if (password.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Por favor ingresa una contraseña')),
                                    );
                                    return;
                                  }

                                  ref.read(registerProvider.notifier).setUsername(username);
                                  ref.read(registerProvider.notifier).setEmail(email);
                                  ref.read(registerProvider.notifier).setPassword(password);

                                  ref.read(appRouterProvider).go(AppRouter.onboard1);
                                },
                              ),
                              const SizedBox(height: 30),
                              GestureDetector(
                                onTap: () {
                                  ref.read(appRouterProvider).go(AppRouter.login);
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
