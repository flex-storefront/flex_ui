import 'package:flutter/material.dart';
import '../theme/brand_theme_extension.dart';

/// Sugar syntax to get access quickly to [ThemeData], [TextTheme], [ColorScheme] and brand colors from context
extension ThemeExtension on BuildContext {
  // Core Flutter theme access
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Brand-specific colors from our theme extension
  BrandThemeExtension get brandColors =>
      Theme.of(this).extension<BrandThemeExtension>() ??
      BrandThemeExtension.light;

  // Device and screen utilities
  Size get deviceSize => MediaQuery.sizeOf(this);
  double get screenWidth => deviceSize.width;
  double get screenHeight => deviceSize.height;
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  // Platform and state utilities
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isKeyboardVisible => viewInsets.bottom > 0;

  // Responsive breakpoints (common design system values)
  bool get isMobile => screenWidth < 768;
  bool get isTablet => screenWidth >= 768 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;

  // Safe area helpers
  EdgeInsets get safeAreaPadding => MediaQuery.paddingOf(this);
  double get statusBarHeight => safeAreaPadding.top;
  double get bottomSafeArea => safeAreaPadding.bottom;
}
