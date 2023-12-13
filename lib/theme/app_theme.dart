import 'package:voco/export/view_exports.dart';
import 'package:voco/theme/app_colors.dart';

final theme = ThemeData.dark().copyWith(
  primaryColor: AppColors.primary,
  backgroundColor: AppColors.backgroundColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: AppColors.white),
  ),
  errorColor: AppColors.error,
);
