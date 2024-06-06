import 'package:flutter/material.dart';

import '../core_lib/wolt_responsive_layout_grid.dart';


extension BuiltContextExtensionForWoltScreenSize on BuildContext {

  WoltScreenSize get screenSize {
    var screenWidth = MediaQuery.of(this).size.width;
    return screenWidth < WoltScreenWidthAdaptiveWidget.defaultWidthBreakPoint
        ? WoltScreenSize.small
        : WoltScreenSize.large;
  }
}
