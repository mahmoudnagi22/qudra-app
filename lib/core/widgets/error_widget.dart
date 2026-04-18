import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class ErrorWidgetUi extends StatelessWidget {
  const ErrorWidgetUi({
    super.key,
    this.onPressed, required this.txt1, required this.txt2, required this.photo,
  });
  final void Function()? onPressed;
  final String txt1 ; 
  final String txt2 ; 
  final String photo ; 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Image
            SizedBox(
              height: 140.h,
              width: 140.w,
              child: SvgPicture.asset(
                photo,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: 16.h),

            /// Title
            Text(
              txt1, // "No Internet Connection"
              style: AppTextStyles.text16Medium.copyWith(color: AppColors.main),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 8.h),

            /// Description
            Text(
              txt2,
              style: AppTextStyles.text14Regular
                  .copyWith(color: AppColors.darkGray, height: 1.5),
              textAlign: TextAlign.center,
            ),

            /// Retry Button
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.replay,
                  color: AppColors.main,
                ))
          ],
        ),
      ),
    );
  }
}
