import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class CarRowDatails extends StatelessWidget {
  const CarRowDatails({
    super.key,
    required this.txt1,
    required this.txt2,
    this.textStyle,
  });
  final String txt1;
  final String txt2;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(txt1,
            // ignore: prefer_if_null_operators
            style: textStyle ?? AppTextStyles.text12Regular),
        Expanded(
            child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.end,
                txt2,
                style: textStyle != null
                    ? AppTextStyles.text14Medium
                        .copyWith(color: AppColors.darkGray)
                    : AppTextStyles.text14Medium)),
      ],
    );
  }
}
