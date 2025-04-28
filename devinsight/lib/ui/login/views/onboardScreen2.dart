import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:devinsight/ui/login/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/providers/register_provider.dart';

/// Proveedor de estado para los lenguajes seleccionados
final selectedTechProvider = StateNotifierProvider<SelectedTechNotifier, Set<String>>((ref) {
  return SelectedTechNotifier();
});

class SelectedTechNotifier extends StateNotifier<Set<String>> {
  SelectedTechNotifier() : super({});

  void toggle(String tech) {
    if (state.contains(tech)) {
      state = {...state}..remove(tech);
    } else if (state.length < 10) {
      state = {...state, tech};
    }
  }
}

class OnboardingPage2 extends ConsumerWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, IconData> techIcons = {
      "Python": FontAwesomeIcons.python,
      "Java": FontAwesomeIcons.java,
      "Rust": FontAwesomeIcons.rust,
      "C#": FontAwesomeIcons.ccDiscover,
      "HTML": FontAwesomeIcons.html5,
      "CSS": FontAwesomeIcons.css3Alt,
      "JavaScript": FontAwesomeIcons.js,
      "C++": FontAwesomeIcons.cuttlefish,
      "Go": FontAwesomeIcons.golang,
      "C": FontAwesomeIcons.cuttlefish,
    };

    final selectedSet = ref.watch(selectedTechProvider);

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
            // AppBar
            Container(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 17, 6, 48).withOpacity(0.1),
                    const Color.fromARGB(255, 4, 1, 9).withOpacity(0.1),
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
                      style: TextStyle(color: AppColors.tertiaryColors, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            // Títulos
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

            // Lenguajes
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: techIcons.keys.map((language) {
                    final isSelected = selectedSet.contains(language);

                    return ChoiceChip(
                      avatar: Icon(
                        techIcons[language],
                        color: Colors.white,
                        size: 18,
                      ),
                      label: Text(language),
                      selected: isSelected,
                      onSelected: (bool selected) {
                        final notifier = ref.read(selectedTechProvider.notifier);

                        notifier.toggle(language);
                      },
                      labelStyle: const TextStyle(color: Colors.white),
                      backgroundColor: Colors.grey[850],
                      selectedColor: AppColors.tertiaryColors,
                    );
                  }).toList(),
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
                      final selectedLanguages = ref.read(selectedTechProvider);
                      final registerNotifier = ref.read(registerProvider.notifier);

                      registerNotifier.setProgrammingLanguages(selectedLanguages.toList());

                      ref.read(appRouterProvider).go(AppRouter.onboard3);
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
