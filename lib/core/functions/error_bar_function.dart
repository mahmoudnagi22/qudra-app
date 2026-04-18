import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:toastification/toastification.dart';

void buildErrorBar(BuildContext context, String msg) {
 toastification.show(
              backgroundColor: AppColors.main,
              alignment: Alignment.bottomCenter,
              context: context,
              title: Text(
                msg,
                style: AppTextStyles.text14Regular.copyWith(height: 1.5.h)
                    .copyWith(color: AppColors.white),
              ),
              icon: const Icon(
                Icons.error,
                color: AppColors.white,
              ),
              autoCloseDuration: const Duration(seconds: 5),
            );
}
