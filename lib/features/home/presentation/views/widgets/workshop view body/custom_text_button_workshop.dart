import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class CustomTextButtonWorkshop extends StatelessWidget {
  const CustomTextButtonWorkshop(
      {super.key, required this.photo, required this.txt, this.onPressed});
  final String txt;
  final String photo;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [AppShadows.dropShadow],
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(double.infinity, 40.h),
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(photo),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  txt,
                  style: AppTextStyles.text14Medium
                      .copyWith(color: AppColors.black),
                )
              ],
            )),
      ),
    );
  }
}
