import 'package:flutter/material.dart';

class PromoColors {
  static const Color deepNavy = Color(0xFF0F1B2D);
  static const Color charcoal = Color(0xFF2C3E50);
  static const Color beige = Color(0xFFF5F0E8);
  static const Color beigeDark = Color(0xFFE8DFD0);
  static const Color gold = Color(0xFFC9A962);
  static const Color goldLight = Color(0xFFE8D5A3);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A2332);
  static const Color textSecondary = Color(0xFF5A6577);
  static const Color cardSurface = Color(0xFFFAFAF8);
}

class PromoTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: PromoColors.deepNavy,
      primary: PromoColors.deepNavy,
      secondary: PromoColors.gold,
      surface: PromoColors.beige,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: PromoColors.beige,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: PromoColors.textPrimary,
          height: 1.2,
          letterSpacing: -0.5,
        ),
        displayMedium: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: PromoColors.textPrimary,
          height: 1.25,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: PromoColors.textPrimary,
          height: 1.3,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: PromoColors.textPrimary,
          height: 1.35,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: PromoColors.textPrimary,
          height: 1.4,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: PromoColors.textPrimary,
          height: 1.45,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: PromoColors.textSecondary,
          height: 1.7,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: PromoColors.textSecondary,
          height: 1.65,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: PromoColors.deepNavy,
          letterSpacing: 0.3,
        ),
      ),
      cardTheme: CardThemeData(
        color: PromoColors.cardSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: PromoColors.beigeDark.withValues(alpha: 0.8)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: PromoColors.deepNavy,
          foregroundColor: PromoColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: PromoColors.deepNavy,
          side: const BorderSide(color: PromoColors.gold, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: PromoColors.white,
        side: BorderSide(color: PromoColors.gold.withValues(alpha: 0.4)),
        labelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: PromoColors.charcoal,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      dividerTheme: DividerThemeData(
        color: PromoColors.beigeDark.withValues(alpha: 0.6),
        thickness: 1,
      ),
    );
  }

  static BoxDecoration get cardDecoration => BoxDecoration(
    color: PromoColors.cardSurface,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: PromoColors.beigeDark.withValues(alpha: 0.8)),
    boxShadow: [
      BoxShadow(
        color: PromoColors.deepNavy.withValues(alpha: 0.06),
        blurRadius: 24,
        offset: const Offset(0, 8),
      ),
    ],
  );

  static BoxDecoration get heroDecoration => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        PromoColors.deepNavy,
        PromoColors.charcoal,
        PromoColors.deepNavy.withValues(alpha: 0.95),
      ],
    ),
  );

  static BoxDecoration get sectionDecoration =>
      const BoxDecoration(color: PromoColors.white);

  static BoxDecoration get alternateSectionDecoration =>
      const BoxDecoration(color: PromoColors.beige);
}
