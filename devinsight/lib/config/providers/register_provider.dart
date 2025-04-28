// register_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterState {
  final String username;
  final String email;
  final String password;
  final String bio;
  final String profilePicture;
  final List<String> programmingLanguages;

  RegisterState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.bio = '',
    this.profilePicture = '',
    this.programmingLanguages = const [],
  });

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    String? bio,
    String? profilePicture,
    List<String>? programmingLanguages,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      bio: bio ?? this.bio,
      profilePicture: profilePicture ?? this.profilePicture,
      programmingLanguages: programmingLanguages ?? this.programmingLanguages,
    );
  }
}

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier() : super(RegisterState());

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setBio(String bio) {
    state = state.copyWith(bio: bio);
  }

  void setProfilePicture(String profilePicture) {
    state = state.copyWith(profilePicture: profilePicture);
  }

  void setProgrammingLanguages(List<String> languages) {
    state = state.copyWith(programmingLanguages: languages);
  }
}

final registerProvider = StateNotifierProvider<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(),
);
