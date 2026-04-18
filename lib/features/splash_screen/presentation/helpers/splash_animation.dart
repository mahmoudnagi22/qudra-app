import 'package:flutter/material.dart';

Animation<Offset> createSlideAnimation(
    AnimationController controller, Offset begin, Offset end) {
  return Tween<Offset>(begin: begin, end: end)
      .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
}

Animation<double> createFadeAnimation({
  required AnimationController controller,
  double begin = 0.0,
  double end = 1.0,
  Curve curve = Curves.easeIn,
}) {
  return Tween<double>(begin: begin, end: end)
      .animate(CurvedAnimation(parent: controller, curve: curve));
}
