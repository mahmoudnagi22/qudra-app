import 'package:flutter/material.dart';

void clearData(List<TextEditingController> textEditingControllerList) {
  for (final controller in textEditingControllerList) {
    controller.clear();
  }
}
