import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';

class SquareContainerCode extends StatelessWidget {
  const SquareContainerCode({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [AppShadows.dropShadow],
      ),
      child: TextField(
        textDirection: TextDirection.ltr,
        controller: textEditingController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.white)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.white)),
        ),
      ),
    );
  }
}
