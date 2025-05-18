import 'package:devinsight/services/login/profile_service.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
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
  String? imageUrl;

  // Common text styles
  static const TextStyle _titleStyle = TextStyle(
    color: Color(0xFF1ABCFE),
    fontSize: 24,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _subtitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _hintStyle = TextStyle(
    color: Colors.white70,
    fontFamily: "Montserrat",
  );

  static const TextStyle _supportTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.bold,
  );

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

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
          color: AppColors.background,
          child: Column(
            children: [
              Expanded(child: _buildProfileSetupSection()),
              _buildFooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSetupSection() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Configura tu perfil", style: _titleStyle),
          const SizedBox(height: 20),
          _buildProfileImagePicker(),
          const SizedBox(height: 20),
          const Text("Añade tu biografía", style: _subtitleStyle),
          const SizedBox(height: 10),
          _buildBioTextField(),
        ],
      ),
    );
  }

  Widget _buildProfileImagePicker() {
    return GestureDetector(
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
    );
  }

  Widget _buildBioTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _bioController,
        maxLines: 3,
        style: const TextStyle(color: Colors.white, fontFamily: "Montserrat"),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.thirdColors,
          hintText: "Escribe algo sobre ti...",
          hintStyle: _hintStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildFooterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            text: "Continuar",
            onPressed: _onContinuePressed,
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _onSupportPressed,
            child: const Text(
              "¿Necesitas ayuda? Contacta soporte",
              textAlign: TextAlign.center,
              style: _supportTextStyle,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _onContinuePressed() async {
    final bio = _bioController.text;
    final profileImage = _profileImage;

    ref.read(registerProvider.notifier).setBio(bio);

    if (profileImage != null) {
      final uploadedUrl = await uploadImageToSupabase(profileImage);
      if (uploadedUrl != null) {
        ref.read(registerProvider.notifier).setProfilePicture(uploadedUrl);
      } else {
        // Si falló la subida, puedes mostrar un snackbar o alert
        print('Error al subir la imagen');
        return;
      }
    }

    ref.read(appRouterProvider).go(AppRouter.onboard2);
  }

  void _onSupportPressed() {
    print("Reenviar código presionado");
  }
}
