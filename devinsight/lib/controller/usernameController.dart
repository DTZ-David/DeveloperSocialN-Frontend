import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user/user_dto.dart';
import '../repositories/get_user_service.dart';
import '../services/explorer/get_user_service.dart';

final userServiceProvider = Provider((ref) => UserService());

final userRepositoryProvider = Provider((ref) {
  final service = ref.read(userServiceProvider);
  return UserRepository(service);
});

final userSearchControllerProvider = FutureProvider.family<UserDto, String>((ref, username) async {
  final repository = ref.read(userRepositoryProvider);
  return repository.getUserByUsername(username);
});
