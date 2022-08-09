import 'package:flutter/material.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_theme.dart';

extension EChangedProperties on StatusFiled? {
  Color get bgChangedColor {
    switch (this) {
      case StatusFiled.UP:
        return baseColor.green50.withOpacity(.5);
      case StatusFiled.DOWN:
        return baseColor.red50.withOpacity(.5);
      case StatusFiled.NONE:
      default:
        return Colors.transparent;
    }
  }

  Color bgChangedColorGrey({Color? defaultColor}) {
    switch (this) {
      case StatusFiled.UP:
      case StatusFiled.DOWN:
        return baseColor.background3;
      case StatusFiled.NONE:
      default:
        return defaultColor ?? Colors.transparent;
    }
  }

  Color textChangedColor(Color defaultColor) {
    switch (this) {
      case StatusFiled.UP:
      case StatusFiled.DOWN:
        return baseColor.grey10;
      case StatusFiled.NONE:
      default:
        return defaultColor;
    }
  }

  Color? bChangedBColor(Color defaultColor) {
    switch (this) {
      case StatusFiled.UP:
      case StatusFiled.DOWN:
        return defaultColor.withOpacity(0.5);
      case StatusFiled.NONE:
      default:
        return null;
    }
  }
}
