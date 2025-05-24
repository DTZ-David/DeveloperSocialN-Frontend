import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

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
  EditProfileNotifier() : super(EditProfileState());

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
    final updatedUsername = state.username;
    final updatedEmail = state.email;
    final updatedImage = state.profileImage;

    // Aquí normalmente harías llamadas a un repositorio o servicio
    // Por ejemplo:
    // await userRepository.updateUserProfile(...);

    // Simulamos un delay como si fuera una API
    await Future.delayed(const Duration(seconds: 1));

    // Aquí podrías limpiar la imagen seleccionada, si ya fue subida
    state = state.copyWith(profileImage: null);
  }
}

final editProfileProvider =
    StateNotifierProvider<EditProfileNotifier, EditProfileState>(
  (ref) => EditProfileNotifier(),
);
