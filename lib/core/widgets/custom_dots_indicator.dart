import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.currentPage,
    required this.dotsCount,
  });
  final int currentPage;
  final int dotsCount;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      reversed: Directionality.of(context) == TextDirection.rtl,
      dotsCount: dotsCount,
      position: currentPage.toDouble(),
      decorator: DotsDecorator(
        spacing: EdgeInsets.only(left: 2.w),
        activeColor: AppColors.main,
        color: Colors.white,
        size: Size.square(12.r),
        activeSize: Size(12.r, 12.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0.r),
          side: const BorderSide(
              color: Colors.red, width: 1), // ⚪ inactive بحدود حمراء
        ),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0.r),
        ),
      ),
    );
  }
}
