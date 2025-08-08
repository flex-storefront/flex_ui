import 'package:flutter/material.dart';

/// Design tokens for brand colors, semantic colors, and other design values
/// These tokens will be customizable via the Helm admin console
class DesignTokens {
  // Brand Colors (Primary customizable colors)
  static const Color brandPrimary = Color(0xFF013D27); // Dark green
  static const Color brandSecondary = Color(0xFF2437FE); // Blue
  static const Color brandAccent = Color(0xFFF1FF61); // Yellow-green

  // Semantic Colors (Status/feedback colors)
  static const Color semanticSuccess = Color(0xFF22AE45);
  static const Color semanticWarning = Color(0xFFFF9500);
  static const Color semanticError = Color(0xFFFF3B30);
  static const Color semanticInfo = Color(0xFF007AFF);

  // Neutral Colors (Backgrounds, surfaces, text)
  static const Color neutralWhite = Color(0xFFFAFAFA);
  static const Color neutralBlack = Color(0xFF222222);
  static const Color neutralGray100 = Color(0xFFF2F2F2); // Light surface
  static const Color neutralGray200 = Color(0xFFE6E6E6); // Dividers
  static const Color neutralGray300 = Color(0xFFE0E0E0); // Medium surface
  static const Color neutralGray400 = Color(0xFF8E8E93); // Disabled
  static const Color neutralGray800 = Color(0xFF282828); // Dark surface

  // Dark Mode Variants
  static const Color brandPrimaryDark = Color(0xFF7E57C2);
}
