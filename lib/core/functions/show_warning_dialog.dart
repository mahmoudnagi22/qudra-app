import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/widgets/dialog_button.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:qodraapp/generated/l10n.dart';

void showWarningDialog(
  BuildContext context, {
  required final void Function()? accept,
  required final void Function()? reject,
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
                  S.of(context).warning,
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
                          txt: S.of(context).yes,
                          onTap: accept,
                        ),
                      ),
                      const VerticalDivider(thickness: 1),
                      Expanded(
                        child: DialogButton(
                          txt: S.of(context).no,
                          onTap: reject,
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

void showLogoutWarningDialog(
  BuildContext context, {
  required final void Function()? accept,
  required final void Function()? reject,
  required final String txt,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: '',
    pageBuilder: (context, animation, secondaryAnimation) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 360.w),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(22.w, 20.h, 22.w, 12.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  size: 31.sp,
                  color: AppColors.main,
                ),
                SizedBox(height: 12.h),
                Text(
                  S.of(context).warning,
                  style: AppTextStyles.text18Medium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Text(
                  txt,
                  style: AppTextStyles.text14Regular.copyWith(
                    height: 1.4,
                    color: AppColors.darkGray,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 18.h),
                const Divider(thickness: 1, height: 1),
                SizedBox(height: 8.h),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(double.infinity, 48.h),
                            foregroundColor: AppColors.main,
                          ),
                          onPressed: accept,
                          child: Text(
                            S.of(context).yes,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.text16Medium
                                .copyWith(color: AppColors.main),
                          ),
                        ),
                      ),
                      const VerticalDivider(thickness: 1),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(double.infinity, 48.h),
                            foregroundColor: AppColors.darkGray,
                          ),
                          onPressed: reject,
                          child: Text(
                            S.of(context).no,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.text16Medium
                                .copyWith(color: AppColors.darkGray),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
