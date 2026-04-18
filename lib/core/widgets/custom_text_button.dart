import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/screen_size.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined,
    this.width,
    this.icon,
  });
  final String text;
  final void Function()? onPressed;
  final bool? isOutlined;
  final double? width;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      width: context.screenWidth * 0.9,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor:
                  isOutlined == true ? AppColors.white : AppColors.main,
              shape: isOutlined == true
                  ? RoundedRectangleBorder(
                      side: BorderSide(
                          color: AppColors.main,
                          width: width != null ? width! : 1),
                      borderRadius: BorderRadius.circular(10.r),
                    )
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r))),
          onPressed: onPressed,
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: AppTextStyles.text20Medium.copyWith(
                          color: isOutlined == true
                              ? AppColors.main
                              : AppColors.white),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SvgPicture.asset(icon!),
                  ],
                )
              : Text(
                  text,
                  style: AppTextStyles.text20Medium.copyWith(
                      color: isOutlined == true
                          ? AppColors.main
                          : AppColors.white),
                )),
    );
  }
}
