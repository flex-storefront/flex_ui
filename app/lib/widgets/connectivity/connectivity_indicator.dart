import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// A simple connectivity indicator that shows network status as an icon
///
/// Displays different Wi-Fi icons based on connection status:
/// - Connected (isConnected = true): Wi-Fi icon
/// - Disconnected (isConnected = false): Wi-Fi icon with slash
/// - Unknown (isConnected = null): Wi-Fi icon with question mark
class FlexConnectivityIndicator extends StatelessWidget {
  const FlexConnectivityIndicator({
    super.key,
    this.isConnected,
    this.iconSize = 24.0,
    this.connectedColor,
    this.disconnectedColor,
    this.unknownColor,
  });

  /// Connection status: true = connected, false = disconnected, null = unknown
  final bool? isConnected;

  /// Size of the icon
  final double iconSize;

  /// Color for the connected state (defaults to black)
  final Color? connectedColor;

  /// Color for the disconnected state (defaults to gray)
  final Color? disconnectedColor;

  /// Color for the unknown state (defaults to black)
  final Color? unknownColor;

  @override
  Widget build(BuildContext context) {
    if (isConnected == true) {
      return Icon(
        Icons.wifi,
        size: iconSize,
        color: connectedColor ?? Colors.black,
      );
    } else if (isConnected == false) {
      return Icon(
        Icons.wifi_off,
        size: iconSize,
        color: disconnectedColor ?? Colors.grey,
      );
    } else {
      return Icon(
        Icons.signal_wifi_bad,
        size: iconSize,
        color: unknownColor ?? Colors.black,
      );
    }
  }
}

@widgetbook.UseCase(
  name: 'Connected',
  type: FlexConnectivityIndicator,
  path: '[Components]',
)
Widget connectedIndicator(BuildContext context) {
  return const Center(
    child: FlexConnectivityIndicator(
      isConnected: true,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Disconnected',
  type: FlexConnectivityIndicator,
  path: '[Components]',
)
Widget disconnectedIndicator(BuildContext context) {
  return const Center(
    child: FlexConnectivityIndicator(
      isConnected: false,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Unknown',
  type: FlexConnectivityIndicator,
  path: '[Components]',
)
Widget unknownIndicator(BuildContext context) {
  return const Center(
    child: FlexConnectivityIndicator(
      isConnected: null,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom Colors',
  type: FlexConnectivityIndicator,
  path: '[Components]',
)
Widget customColorIndicator(BuildContext context) {
  return const Center(
    child: FlexConnectivityIndicator(
      isConnected: true,
      connectedColor: Colors.green,
    ),
  );
}
