import 'package:flutter/material.dart';
import 'context_extensions.dart';

/// Extensions for showing branded snackbars that use the app's theme colors
extension SnackBarContextExtension on BuildContext {
  void showAppSnackBar({
    required String message,
    bool isError = false,
    bool isSuccess = false,
    bool isWarning = false,
    String? dismissLabel = '✕',
    bool isDismissible = true,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showAppSnackBarInternal(
      message: message,
      isError: isError,
      isSuccess: isSuccess,
      isWarning: isWarning,
      dismissLabel: dismissLabel,
      isDismissible: isDismissible,
      duration: duration,
    );
  }

  void showSuccessSnackBar(String message, {Duration? duration}) {
    showAppSnackBar(
      message: message,
      isSuccess: true,
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  void showErrorSnackBar(String message, {Duration? duration}) {
    showAppSnackBar(
      message: message,
      isError: true,
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  void showWarningSnackBar(String message, {Duration? duration}) {
    showAppSnackBar(
      message: message,
      isWarning: true,
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  void _showAppSnackBarInternal({
    required String message,
    required bool isError,
    required bool isSuccess,
    required bool isWarning,
    required String? dismissLabel,
    required bool isDismissible,
    required Duration duration,
  }) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();

    // Determine colors based on type, using brand theme
    Color backgroundColor;
    Color textColor;

    if (isError) {
      backgroundColor = colorScheme.error;
      textColor = colorScheme.onError;
    } else if (isSuccess) {
      backgroundColor = brandColors.success;
      textColor = brandColors.onSuccess;
    } else if (isWarning) {
      backgroundColor = brandColors.warning;
      textColor = brandColors.onWarning;
    } else {
      backgroundColor = brandColors.info;
      textColor = brandColors.onInfo;
    }

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        action: isDismissible && dismissLabel != null
            ? SnackBarAction(
                label: dismissLabel,
                textColor: textColor.withValues(alpha: 0.8),
                onPressed: () {
                  ScaffoldMessenger.of(this).hideCurrentSnackBar();
                },
              )
            : null,
      ),
    );
  }
}

/// Extension for StatefulWidget States to show snackbars safely
extension SnackBarStateExtension<T extends StatefulWidget> on State<T> {
  void showAppSnackBar({
    required String message,
    bool isError = false,
    bool isSuccess = false,
    bool isWarning = false,
    String? dismissLabel = '✕',
    bool isDismissible = true,
    Duration duration = const Duration(seconds: 4),
  }) {
    if (!mounted) return;
    context.showAppSnackBar(
      message: message,
      isError: isError,
      isSuccess: isSuccess,
      isWarning: isWarning,
      dismissLabel: dismissLabel,
      isDismissible: isDismissible,
      duration: duration,
    );
  }

  void showSuccessSnackBar(String message, {Duration? duration}) {
    if (!mounted) return;
    context.showSuccessSnackBar(message, duration: duration);
  }

  void showErrorSnackBar(String message, {Duration? duration}) {
    if (!mounted) return;
    context.showErrorSnackBar(message, duration: duration);
  }

  void showWarningSnackBar(String message, {Duration? duration}) {
    if (!mounted) return;
    context.showWarningSnackBar(message, duration: duration);
  }
}
