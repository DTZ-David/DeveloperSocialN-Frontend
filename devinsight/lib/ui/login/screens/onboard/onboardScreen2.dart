import 'package:devinsight/ui/login/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:devinsight/config/routers/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingPage2 extends ConsumerWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> languages = [
      "Python",
      "Java",
      "Rust",
      "C#",
      "HTML",
      "CSS",
      "JavaScript"
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 17, 6, 48),
              Color.fromARGB(255, 4, 1, 9),
            ],
          ),
        ),
        child: Column(
          children: [
            // AppBar personalizado con gradiente
            Container(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // ignore: deprecated_member_use
                    Color.fromARGB(255, 17, 6, 48).withOpacity(0.1),
                    Color.fromARGB(255, 4, 1, 9).withOpacity(0.1),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      ref.read(appRouterProvider).go(AppRouter.onboard1);
                    },
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Saltar",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Veamos tus intereses",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Escoge de 1 a 10 lenguajes, de esta manera te vamos a proveer de contenido único en tu Feed.",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: "Buscar",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Lista de lenguajes
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    languages.length *
                        3, // Repite los lenguajes como en la imagen
                    (index) => ChoiceChip(
                      label: Text(languages[index % languages.length]),
                      selected: false,
                      onSelected: (bool selected) {},
                      labelStyle: const TextStyle(color: Colors.white),
                      backgroundColor: Colors.grey[850],
                      selectedColor: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),

            // Botón Continuar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    text: "Continuar",
                    onPressed: () {
                      ref.read(appRouterProvider).go(AppRouter.onboard3);
                    },
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Reenviar código
          ],
        ),
      ),
    );
  }
}
