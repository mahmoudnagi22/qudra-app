import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.checkBool});
  final bool checkBool;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: 20.h,
      width: 20.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.white,
          boxShadow: const [
            AppShadows.dropShadow,
          ]),
      child: Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: checkBool,
          child: AnimatedOpacity(
            opacity: checkBool == true ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 600),
            child: Center(
                child: Icon(
              Icons.check,
              color: AppColors.green,
              size: 20.h,
            )),
          )),
    );
  }
}
