import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static Color get primaryTextColor => fromHex("#03041D");
  static Color get orange => fromHex("#fb6e3b");
  static Color get textGrey => fromHex("#bebec7");
  static Color get bgGrey => Color.fromRGBO(246, 246, 246, 1);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
