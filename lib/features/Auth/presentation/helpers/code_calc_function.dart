import 'package:flutter/material.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/constants.dart';

String codeCalc(List<TextEditingController> textEditingControllerList) {
  String code = '';
  String lang = SharedPrefs.getString(selectedLanguageType);
  if (lang == "en") {
    for (int i = 0; i < textEditingControllerList.length; i++) {
      code += textEditingControllerList[i].text;
    }
  } else {
    for (int i = textEditingControllerList.length - 1; i >= 0; i--) {
      code += textEditingControllerList[i].text;
    }
  }

  return code;
}
