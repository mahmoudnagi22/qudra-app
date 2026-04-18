import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({
    super.key,
    required this.txt,
  });
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.topStart,
        child: Padding(
          padding: edgeInsets,
          child: Text(
            txt,
            style: AppTextStyles.text14Medium,
          ),
        ));
  }
}
