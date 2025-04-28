import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../config/providers/register_provider.dart';
import '../../../config/routers/app_router.dart';
import '../widgets/widgets_login.dart';
import 'dart:io';

class OnboardingPage1 extends ConsumerStatefulWidget {
  const OnboardingPage1({super.key});

  @override
  _OnboardingPage1State createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends ConsumerState<OnboardingPage1> {
  final TextEditingController _bioController = TextEditingController();
  XFile? _profileImage;

  // Método para seleccionar la imagen
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Configura tu perfil",
                        style: TextStyle(
                          color: Color(0xFF1ABCFE),
                          fontSize: 24,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[300],
                          backgroundImage:
                              _profileImage == null ? null : FileImage(File(_profileImage!.path)),
                          child: _profileImage == null
                              ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[600])
                              : null,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Añade tu biografía",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          controller: _bioController,
                          maxLines: 3,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.4),
                            hintText: "Escribe algo sobre ti...",
                            hintStyle: const TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
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
                    CustomButton(
                      text: "Continuar",
                      onPressed: () {
                        final bio = _bioController.text;
                        final profileImage = _profileImage?.path ?? '';

                        ref.read(registerProvider.notifier).setBio(bio);
                        ref.read(registerProvider.notifier).setProfilePicture(profileImage);

                        ref.read(appRouterProvider).go(AppRouter.onboard2);
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        print("Reenviar código presionado");
                      },
                      child: const Text(
                        "¿Necesitas ayuda? Contacta soporte",
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
