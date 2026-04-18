import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.txt, required this.color});
  final String txt;
  final Color color ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color:color ),
        ),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                txt,
                style: AppTextStyles.text16Regular,
                textAlign: TextAlign.right,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
