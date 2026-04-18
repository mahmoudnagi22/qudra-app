import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/generated/l10n.dart';

class ServiceDescriptionBox extends StatelessWidget {
  const ServiceDescriptionBox({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.main.withOpacity(.35), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).notes,
            style: AppTextStyles.text14Regular.copyWith(
              color: AppColors.main,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            description,
            style: AppTextStyles.text14Regular.copyWith(
              color: AppColors.darkGray,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
