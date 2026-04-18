import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/widgets/dialog_button.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:qodraapp/generated/l10n.dart';

void showSuccessDialog(
  BuildContext context, {
  required final void Function()? accept,
  required final String txt,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: '',
    pageBuilder: (context, animation, secondaryAnimation) {
      return Dialog(
        child: Container(
          padding: edgeInsets,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.of(context).success_done,
                  style: AppTextStyles.text16Medium,
                ),
                SizedBox(height: 15.h),
                Text(
                  txt,
                  style: AppTextStyles.text14Regular.copyWith(height: 1.5.h),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                const Divider(thickness: 1, height: 1),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DialogButton(
                          color: AppColors.main,
                          txt: S.of(context).ok,
                          onTap: accept,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
  );
}
