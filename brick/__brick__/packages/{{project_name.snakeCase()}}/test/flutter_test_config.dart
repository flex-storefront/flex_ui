import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:flutter/material.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      goldenTestTheme: GoldenTestTheme(
        backgroundColor: Colors.white,
        borderColor: Colors.black26,
        padding: const EdgeInsets.all(40),
        nameTextStyle: const TextStyle(
          fontSize: FlexSizes.fontSizeMd,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          letterSpacing: 1.5,
        ),
      ),
      theme: ThemeData(
        extensions: const [
          FlexAppColorScheme.lightScheme,
          FlexAppColorScheme.darkScheme,
        ],
      ),
    ),
    run: testMain,
  );
}
