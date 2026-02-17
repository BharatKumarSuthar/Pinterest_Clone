import 'package:pinterest_clone/main_index.dart';

class AppTheme {
  static final lightTheme = ThemeData();
  static final darkTheme = ThemeData(
    brightness: .dark,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      surfaceTintColor: AppColors.transparent,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 57),
      displayMedium: TextStyle(fontSize: 45),
      displaySmall: TextStyle(fontSize: 36),
      headlineLarge: TextStyle(fontSize: 32),
      headlineMedium: TextStyle(fontSize: 28),
      headlineSmall: TextStyle(fontSize: 24),
      titleLarge: TextStyle(fontSize: 22),
      titleMedium: TextStyle(fontSize: 16),
      titleSmall: TextStyle(fontSize: 14),
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      bodySmall: TextStyle(fontSize: 12),
      labelLarge: TextStyle(fontSize: 14),
      labelMedium: TextStyle(fontSize: 12),
      labelSmall: TextStyle(fontSize: 11),
    ),
  );
}
