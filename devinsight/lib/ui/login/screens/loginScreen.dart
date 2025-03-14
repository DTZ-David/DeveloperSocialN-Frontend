import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import '../widgets/socialButton.dart';
import 'package:flutter/services.dart'; // Importa esto

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Bloquear la orientación en modo vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 20, 6, 48),
              Color.fromARGB(255, 4, 1, 9)
            ],
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/saturn.svg',
              height: 200,
              width: 200,
              color: const Color(0xFF1ABCFE),
            ),
            const SizedBox(height: 12),
            const Text(
              "DevInsight",
              style: TextStyle(
                color: Color(0xFF1ABCFE),
                fontSize: 48,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const CustomTextField(label: "Usuario", icon: Icons.person),
                  const SizedBox(height: 20),
                  const CustomTextField(
                      label: "Contraseña", icon: Icons.lock, isPassword: true),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(
                            color: Color(0xFF1ABCFE),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: "Iniciar Sesión",
                    onPressed: () {
                      print("Iniciar Sesión presionado");
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SocialButton(
                          icon: 'assets/icons/github.svg',
                          onPressed: () => print("GitHub"),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SocialButton(
                          icon: 'assets/icons/google.svg',
                          onPressed: () => print("Google"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => print("Crear una cuenta"),
                    child: const Text(
                      "Crear una cuenta",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
