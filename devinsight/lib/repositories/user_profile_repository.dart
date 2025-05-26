// user_repository.dart
import 'package:devinsight/services/profile/user_profile_service.dart';

class UserProfileRepository {
  final UserProfileService _service;

  UserProfileRepository(this._service);

  Future<void> updateUsername(String token, String username) {
    return _service.updateUsername(token, username);
  }

  Future<void> updateProfilePicture(String token, String base64Image) {
    return _service.updateProfilePicture(token, base64Image);
  }
}
