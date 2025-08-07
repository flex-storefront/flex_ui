import 'package:flutter/material.dart';
import 'design_tokens.dart';

/// Brand-specific theme extension for colors not covered by Material Design
/// This contains semantic colors and brand-specific colors that go beyond
/// the standard Material ColorScheme
class BrandThemeExtension extends ThemeExtension<BrandThemeExtension> {
  // Semantic colors for status/feedback
  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;

  // Brand-specific colors
  final Color brandAccent;
  final Color onBrandAccent;

  // Additional utility colors
  final Color disabled;
  final Color onDisabled;
  final Color divider;

  const BrandThemeExtension({
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
    required this.brandAccent,
    required this.onBrandAccent,
    required this.disabled,
    required this.onDisabled,
    required this.divider,
  });

  @override
  BrandThemeExtension copyWith({
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    Color? brandAccent,
    Color? onBrandAccent,
    Color? disabled,
    Color? onDisabled,
    Color? divider,
  }) {
    return BrandThemeExtension(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      brandAccent: brandAccent ?? this.brandAccent,
      onBrandAccent: onBrandAccent ?? this.onBrandAccent,
      disabled: disabled ?? this.disabled,
      onDisabled: onDisabled ?? this.onDisabled,
      divider: divider ?? this.divider,
    );
  }

  @override
  BrandThemeExtension lerp(
    ThemeExtension<BrandThemeExtension>? other,
    double t,
  ) {
    if (other is! BrandThemeExtension) {
      return this;
    }
    return BrandThemeExtension(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      brandAccent: Color.lerp(brandAccent, other.brandAccent, t)!,
      onBrandAccent: Color.lerp(onBrandAccent, other.onBrandAccent, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      onDisabled: Color.lerp(onDisabled, other.onDisabled, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
    );
  }

  /// Light theme brand extension using design tokens
  static const light = BrandThemeExtension(
    success: DesignTokens.semanticSuccess,
    onSuccess: DesignTokens.neutralWhite,
    warning: DesignTokens.semanticWarning,
    onWarning: DesignTokens.neutralWhite,
    info: DesignTokens.semanticInfo,
    onInfo: DesignTokens.neutralWhite,
    brandAccent: DesignTokens.brandAccent,
    onBrandAccent: DesignTokens.neutralBlack,
    disabled: DesignTokens.neutralGray400,
    onDisabled: DesignTokens.neutralWhite,
    divider: DesignTokens.neutralGray200,
  );

  /// Dark theme brand extension using design tokens
  static const dark = BrandThemeExtension(
    success: DesignTokens.semanticSuccess,
    onSuccess: DesignTokens.neutralWhite,
    warning: DesignTokens.semanticWarning,
    onWarning: DesignTokens.neutralWhite,
    info: DesignTokens.semanticInfo,
    onInfo: DesignTokens.neutralWhite,
    brandAccent: DesignTokens.brandAccent,
    onBrandAccent: DesignTokens.neutralWhite, // Different for dark mode
    disabled: DesignTokens.neutralGray400,
    onDisabled: DesignTokens.neutralWhite,
    divider: DesignTokens.neutralGray200,
  );
}

/// Extension to easily access brand colors from any context
extension BrandColors on BuildContext {
  BrandThemeExtension get brandColors =>
      Theme.of(this).extension<BrandThemeExtension>()!;
}
