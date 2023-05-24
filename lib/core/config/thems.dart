import 'package:flutter/material.dart';

import 'colorz.dart';


class CustomTheme {

  static TextStyle get textStyleTextBig {
    return const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colorz.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    );
  }
}