import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class CustomHomebar extends StatelessWidget {
  const CustomHomebar({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txt,
              style: AppTextStyles.text18Medium,
            )
          ],
        ),
      ),
    );
  }
}
