import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';

OutlineInputBorder styleTextField() {
  return OutlineInputBorder(
    borderSide: const BorderSide(width: 0.5, color: AppColors.darkGray),
    borderRadius: BorderRadius.circular(10.r),
  );
}

OutlineInputBorder styleTextFieldError() {
  return OutlineInputBorder(
    borderSide: const BorderSide(width: 2, color: AppColors.main),
    borderRadius: BorderRadius.circular(10.r),
  );
}
