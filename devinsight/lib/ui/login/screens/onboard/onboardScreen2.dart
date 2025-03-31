import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {},
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
                    languages.length * 3, // Repite los lenguajes como en la imagen
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
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnboardingPage2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1ABCFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Continuar",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            // Reenviar código
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "No te llegó? Reenviar el código",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
