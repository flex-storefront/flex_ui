import 'package:flutter/material.dart';

class GoldenHelperScreenSizes {
  static const Map<String, BoxConstraints> defaultScreenSizes = {
    'iPhone SE': BoxConstraints.tightFor(width: 375, height: 667),
    'iPhone 16': BoxConstraints.tightFor(width: 390, height: 844),
    'iPhone 16 Pro Max': BoxConstraints.tightFor(width: 428, height: 926),
    'iPad': BoxConstraints.tightFor(width: 768, height: 1024),
  };
}
