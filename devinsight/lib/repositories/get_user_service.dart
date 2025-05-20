import '../models/user/user_dto.dart';
import '../services/explorer/get_user_service.dart';

class UserRepository {
  final UserService _userService;

  UserRepository(this._userService);

  Future<UserDto> getUserByUsername(String username, String token) {
    return _userService.searchUserByUsername(username, token);
  }
}
