import 'dart:io';
import 'package:devinsight/config/providers/auth_provider.dart';
import 'package:devinsight/config/providers/edit_profile_provider.dart';
import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/login/widgets/modern_snackbar.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  XFile? _profileImage;
  String? originalUsername;
  String? originalEmail;

  bool get hasChanges {
    return _usernameController.text != originalUsername ||
        _emailController.text != originalEmail ||
        _profileImage != null;
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile;
      });
      ref.read(editProfileProvider.notifier).updateProfileImage(pickedFile);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final user = ref.read(authProvider).user;

      // Cargar datos en los controladores
      _usernameController.text = user.userName;
      _emailController.text = user.email;

      // Guardar los valores originales también
      originalUsername = user.userName;
      originalEmail = user.email;

      ref.read(editProfileProvider.notifier).loadInitialData(
            username: user.userName,
            email: user.email,
            profileImageUrl: user.profilePicture,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.thirdColors,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Editar perfil",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(appRouterProvider).go(AppRouter.initial);
          },
        ),
        actions: [
          if (hasChanges)
            TextButton(
              onPressed: () => _saveChanges(context),
              child: const Text(
                "Guardar cambios",
                style: TextStyle(
                  color: Color(0xFF1ABCFE),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _buildProfileImage(),
            const SizedBox(height: 32),
            _buildTextField(
              controller: _usernameController,
              label: "Nombre de usuario",
              hint: "Ingresa tu nombre",
              onChanged: (value) {
                ref.read(editProfileProvider.notifier).updateUsername(value);
              },
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _emailController,
              label: "Correo electrónico",
              hint: "Ingresa tu email",
              onChanged: (value) {
                ref.read(editProfileProvider.notifier).updateEmail(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    final user = ref.watch(authProvider).user;

    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[300],
          backgroundImage: _profileImage != null
              ? FileImage(File(_profileImage!.path))
              : NetworkImage(user.profilePicture) as ImageProvider,
          child: _profileImage == null
              ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[600])
              : null,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    void Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          onChanged: (value) {
            onChanged?.call(value);
            setState(() {}); // Para que se habilite "Guardar cambios"
          },
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54),
            filled: true,
            fillColor: AppColors.background,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  void _saveChanges(BuildContext context) async {
    try {
      final editNotifier = ref.read(editProfileProvider.notifier);
      // Guardamos los cambios (simulado)
      await editNotifier.saveChanges();

      final username = ref.read(editProfileProvider).username;
      final email = ref.read(editProfileProvider).email;
      final profileImage =
          _profileImage != null ? File(_profileImage!.path) : null;

      ModernSnackBar.show(
        context,
        "Cambios guardados exitosamente para $username con correo $email con imagen ${profileImage?.path ?? 'sin cambios'}",
        isError: false,
      );

      setState(() {
        originalUsername = _usernameController.text;
        originalEmail = _emailController.text;
        _profileImage = null;
      });

      ref.read(appRouterProvider).go(AppRouter.initial);
    } catch (e) {
      ModernSnackBar.show(context, "Error al guardar cambios: $e",
          isError: true);
    }
  }
}
