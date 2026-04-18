import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/generated/l10n.dart';

class DetalisText extends StatelessWidget {
  const DetalisText({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        S.of(context).details,
        style: AppTextStyles.text12Regular.copyWith(
          color: AppColors.main,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
