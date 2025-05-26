import 'dart:convert';
import 'package:devinsight/repositories/user_profile_repository.dart';
import 'package:devinsight/services/profile/user_profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../config/providers/auth_provider.dart';

// Modelo de estado para la edición del perfil
class EditProfileState {
  final String username;
  final String email;
  final XFile? profileImage; // Imagen nueva seleccionada
  final String? profileImageUrl; // Imagen actual del usuario

  EditProfileState({
    this.username = '',
    this.email = '',
    this.profileImage,
    this.profileImageUrl,
  });

  EditProfileState copyWith({
    String? username,
    String? email,
    XFile? profileImage,
    String? profileImageUrl,
  }) {
    return EditProfileState(
      username: username ?? this.username,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}

// Lógica de negocio
class EditProfileNotifier extends StateNotifier<EditProfileState> {
  final Ref ref;

  EditProfileNotifier(this.ref) : super(EditProfileState());

  void loadInitialData({
    required String username,
    required String email,
    required String profileImageUrl,
  }) {
    state = state.copyWith(
      username: username,
      email: email,
      profileImageUrl: profileImageUrl,
    );
  }

  void updateUsername(String username) {
    state = state.copyWith(username: username);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateProfileImage(XFile image) {
    state = state.copyWith(profileImage: image);
  }

  void clearChanges() {
    state = EditProfileState();
  }

  Future<void> saveChanges() async {
    final token = ref.read(authProvider).token;
    final repository = ref.read(userRepositoryProvider);

    try {
      // Actualizar username
      if (state.username.isNotEmpty) {
        await repository.updateUsername(token, state.username);
      }

      // Subir imagen si hay una nueva seleccionada
      if (state.profileImage != null) {
        final bytes = await state.profileImage!.readAsBytes();
        final base64Image = base64Encode(bytes);
        await repository.updateProfilePicture(token, base64Image);
      }

      // Limpiar imagen seleccionada tras subida
      state = state.copyWith(profileImage: null);
    } catch (e) {
      print('Error al guardar cambios: $e');
      // Puedes manejar errores aquí si necesitas mostrar en UI
    }
  }
}

// Proveedor de repositorio
final userRepositoryProvider = Provider<UserProfileRepository>((ref) {
  return UserProfileRepository(UserProfileService());
});

// Proveedor del controlador de edición de perfil
final editProfileProvider = StateNotifierProvider<EditProfileNotifier, EditProfileState>(
  (ref) => EditProfileNotifier(ref),
);
