import 'package:flutter/material.dart';

PageRouteBuilder<dynamic> buildFadeRoute({
  required Widget page,
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
