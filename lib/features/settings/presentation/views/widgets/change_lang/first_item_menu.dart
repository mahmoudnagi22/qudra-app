import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class FirstItemMenu extends StatelessWidget {
  const FirstItemMenu({
    super.key,
    required this.lang,
  });

  final String lang;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 48.h, minWidth: 120.w),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 10.w, end: 6.w),
        child: Row(
          children: [
            Expanded(
              child: Text(
                lang,
                textAlign: TextAlign.start,
                style: AppTextStyles.text14Medium,
              ),
            ),
            SizedBox(width: 6.w),
            Icon(
              Icons.keyboard_arrow_down,
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
