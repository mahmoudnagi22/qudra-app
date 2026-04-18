import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.onTap,
    required this.txt,
    this.color,
  });
  final void Function()? onTap;
  final String txt;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(txt,
          textAlign: TextAlign.center,
          style: AppTextStyles.text16Regular
              .copyWith(color: color ?? AppColors.darkGray)),
    );
  }
}
