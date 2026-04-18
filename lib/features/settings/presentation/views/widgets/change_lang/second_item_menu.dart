import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class SecondItemMenu extends StatelessWidget {
  const SecondItemMenu({
    super.key,
    required this.onTap,
    required this.lang,
  });
  final void Function() onTap;
  final String lang;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Divider(
          color: AppColors.lightGray,
          thickness: 1.w,
          endIndent: 10.w,
          indent: 10.w,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
            child: Text(
              lang,
              textAlign: TextAlign.start,
              style: AppTextStyles.text14Medium,
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
      ],
    );
  }
}
