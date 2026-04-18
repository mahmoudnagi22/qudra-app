import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/generated/l10n.dart';

class ResendCodeText extends StatelessWidget {
  const ResendCodeText({
    super.key,
    required this.seconds,
  });

  final int seconds;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Align(
          alignment: AlignmentDirectional.topEnd,
          child: Text(
            S.of(context).resendCodeAfter40Seconds(seconds),
            style: AppTextStyles.text12Regular,
          )),
    );
  }
}
