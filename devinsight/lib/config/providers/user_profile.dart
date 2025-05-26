// user_provider.dart
import 'package:devinsight/repositories/user_profile_repository.dart';
import 'package:devinsight/services/profile/user_profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserProfileRepository>((ref) {
  return UserProfileRepository(UserProfileService());
});
