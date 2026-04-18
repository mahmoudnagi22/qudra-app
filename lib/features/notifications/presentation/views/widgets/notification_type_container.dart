import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class NotificationTypeContainer extends StatelessWidget {
  const NotificationTypeContainer(
      {super.key,
      required this.text,
      required this.icon,
      required this.isChecked});
  final String text;
  final String? icon;
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Container(
          height: 32.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: isChecked ? AppColors.mainLighter : AppColors.white,
            boxShadow: const [AppShadows.dropShadow],
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: icon == null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text,
                      style: AppTextStyles.text14Medium,
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(icon!),
                    SizedBox(width: 5.w),
                    Text(
                      text,
                      style: AppTextStyles.text14Medium,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
