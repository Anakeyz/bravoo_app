import 'package:flutter/material.dart';

/// App color palette extracted from Figma design (Singleton)
class AppColors {
  AppColors._();
  static final AppColors _instance = AppColors._();
  static AppColors get instance => _instance;

  // Primary colors
  static const Color primaryPurple = Color(0xFF2C0066);
  static const Color deepPurple = Color(0xFF9013FE);
  static const Color purpleGradientStart = Color(0xFF1E0540);
  static const Color purpleGradientEnd = Color(0xFF1E0540);

  // Background colors
  static const Color lightPink = Color(0xFFF5E6F3);
  static const Color lightBackground = Color(0xFFEFE4F0);

  // Text colors
  static const Color darkText = Color(0xFF1E1E1E);
  // static const Color lightText = Color(0xFF757575);
  static const Color lightText = Color(0xFF767676);
  static const Color whiteText = Color(0xFFFFFFFF);

  // Button colors
  static const Color buttonDark = Color(0xFF1F2937);
  static const Color buttonLight = Color(0xFFFFFFFF);

  // Accent colors
  static const Color accentPurple = Color(0xFF8B5CF6);
  static const Color linkPurple = Color(0xFF9333EA);

  // Social button colors
  static const Color googleRed = Color(0xFFDB4437);
  static const Color appleBlack = Color(0xFF000000);

  // Success/Status colors
  static const Color successGreen = Color(0xFF10B981);
  static const Color errorRed = Color(0xFFEF4444);

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9CA3AF);
  static const Color borderColor = Color(0xFFCDCDCD);
  static const Color sliderColor = Color(0xFFD9D9D9);

  // Home page specific colors
  static const Color countdownBg = Color(0xFF5B21B6);
  static const Color linkBg = Color(0xFF705297);
  static const Color countdownBoxBg = Color(0x33FFFFFF);
  static const Color qualificationCardBg = Color(0x1AFFFFFF);
  static const Color socialButtonBg = Color(0x33FFFFFF);
}
