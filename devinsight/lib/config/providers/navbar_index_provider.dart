// ignore_for_file: prefer_function_declarations_over_variables

import 'package:devinsight/config/routers/app_router.dart';

final navbarIndexFromPath = (String location) {
  if (location.startsWith(AppRouter.home)) return 0;
  if (location.startsWith(AppRouter.publications)) return 1;
  if (location.startsWith(AppRouter.explorer)) return 2;
  if (location.startsWith(AppRouter.profile)) return 4;
  return 0;
};
