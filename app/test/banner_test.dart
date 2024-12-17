import 'package:alchemist/alchemist.dart';
import 'package:flex_ui/flex_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/golden_test_helper.dart';
import 'helpers/pump_app.dart';

void main() {
  const testName = 'FlexBanner';

  group(testName, () {
    final themes = [FlexAppThemes.lightTheme, FlexAppThemes.darkTheme];

    final tests = [
      (
        description: '$testName with Horizontal Layout',
        fileName: '${testName}_Horizontal',
        orientation: Axis.horizontal,
      ),
      (
        description: '$testName with Vertical Layout',
        fileName: '${testName}_Vertical',
        orientation: Axis.vertical,
      ),
    ];

    for (final theme in themes) {
      final themeName = theme == FlexAppThemes.lightTheme ? 'Light' : 'Dark';

      for (final test in tests) {
        goldenTest(
          '${test.description} - $themeName',
          fileName: '${test.fileName}_$themeName',
          pumpBeforeTest: (tester) async {
            await tester.pump(const Duration(seconds: 1));
          },
          pumpWidget: (tester, widget) async {
            await tester.pumpApp(widget, theme);
            await tester.pumpAndSettle();
          },
          builder: () {
            return GoldenTestGroup(
              children: [
                for (final entry
                    in GoldenHelperScreenSizes.defaultScreenSizes.entries)
                  GoldenTestScenario(
                    name: '${entry.key} - $themeName',
                    constraints: entry.value,
                    child: Container(
                      color: theme.scaffoldBackgroundColor,
                      padding: const EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.center, // Centers the widget
                        child: SizedBox(
                          width:
                              test.orientation == Axis.horizontal ? null : 300,
                          height:
                              test.orientation == Axis.horizontal ? 400 : 600,
                          child: FlexBanner(
                            title: const Text(
                              'Halloween Specials!',
                              textAlign: TextAlign.center,
                            ),
                            image: const FlexImage(
                              'https://loremflickr.com/240/320?lock=666',
                              placeholder: SizedBox.shrink(),
                            ),
                            orientation: test.orientation,
                            imageLayout: FlexBannerImageLayout.end,
                            overline: const Text(
                              'FEATURED',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            description: const Text(
                              'Get our best Halloween deals before it\'s too late!',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      }
    }
  });
}
