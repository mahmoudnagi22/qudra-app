import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/screen_size.dart';
import 'package:qodraapp/generated/l10n.dart';

class TextSpanLogIn extends StatelessWidget {
  const TextSpanLogIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.80,
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
            text: S.of(context).noAccountTitle,
            style: AppTextStyles.text12Regular
                .copyWith(color: AppColors.main, height: 1.3.h),
            children: [
              TextSpan(
                text: S.of(context).noAccountAction,
                style: AppTextStyles.text12Regular
                    .copyWith(color: AppColors.black, height: 1.3.h),
              )
            ]),
      ),
    );
  }
}
