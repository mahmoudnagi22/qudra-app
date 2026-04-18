import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class WorkShopNameTrans extends StatelessWidget {
  const WorkShopNameTrans({
    super.key,
    required this.name,
    required this.label,
    this.isLoading = false,
  });
  final String name;
  final String label;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.lightGray,
          ),
          color: AppColors.mainLight.withValues(alpha: 0.3),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '$label: ${isLoading ? '' : name}',
                style: AppTextStyles.text14Medium
                    .copyWith(color: AppColors.darkGray),
                textAlign: TextAlign.start,
              ),
            ),
            if (isLoading)
              SizedBox(
                height: 16.h,
                width: 16.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.main,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
