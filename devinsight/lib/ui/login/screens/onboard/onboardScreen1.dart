import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/login/widgets/customButton2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage1 extends ConsumerWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Colocándote a bordo",
                        style: TextStyle(
                          color: Color(0xFF1ABCFE),
                          fontSize: 24,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SvgPicture.asset(
                        'assets/icons/rocket.svg',
                        height: 150,
                        width: 150,
                        color: const Color(0xFF1ABCFE),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Ingresa el código",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Te hemos enviado un código al correo user@gmail.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          4,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 81,
                            height: 110,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(31, 33, 42, 100),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "X", // Aquí pondrías el número ingresado
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Color.fromARGB(255, 56, 56, 61),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton2(
                      text: "Continuar",
                      onPressed: () {
                        ref.read(appRouterProvider).go(AppRouter
                            .onboard2); // Navegar a la siguiente pantalla
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        print("Reenviar código presionado");
                      },
                      child: const Text(
                        "¿No te llegó el codigo? Reenviar código",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
