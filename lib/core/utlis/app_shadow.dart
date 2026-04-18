import 'package:flutter/material.dart';

class AppShadows {
  static const BoxShadow dropShadow = BoxShadow(
    color: Color(0x43414140), // نفس اللون من JSON
    offset: Offset(0, 0), // الاتجاه
    blurRadius: 2, // النعومة
    spreadRadius: 0, // الانتشار
  );
}
