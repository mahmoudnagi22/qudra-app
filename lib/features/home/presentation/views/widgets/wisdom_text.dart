import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class WisdomText extends StatelessWidget {
  const WisdomText({super.key, required this.txt, required this.colorRank});
  final String txt;
  final Color colorRank;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.mainDark.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: colorRank.withValues(alpha: 0.55),
          width: 1.1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Text(
          txt,
          textAlign: TextAlign.start,
          style: AppTextStyles.text14Medium.copyWith(
            height: 1.4,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
