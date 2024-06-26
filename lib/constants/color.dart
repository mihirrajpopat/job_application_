import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CommonColor {
  static const Color backgroundColor = Color.fromRGBO(245, 247, 249, 1);

  static const Color primaryColor = Color.fromRGBO(116, 103, 183, 1);

  static const List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Color.fromRGBO(207, 207, 207, 0.9),
      offset: Offset(1, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> boxShadow1 = [
    BoxShadow(
      color: Color.fromRGBO(207, 207, 207, 0.9),
      offset: Offset(1, 1),
      blurRadius: 8,
      spreadRadius: 1,
    ),
  ];
}
