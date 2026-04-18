import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class RequestText extends StatelessWidget {
  const RequestText(
      {super.key,
      required this.color,
      required this.txt,
      required this.border});
  final Color color;
  final String txt;
  final Border? border;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: color,
            border: border),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                txt,
                textAlign: TextAlign.center,
                style: AppTextStyles.text14Regular.copyWith(height: 1.5.h),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
