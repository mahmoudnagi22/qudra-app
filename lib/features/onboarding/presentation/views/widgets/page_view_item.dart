import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/screen_size.dart';
import 'package:qodraapp/features/onboarding/domain/entities/on_boarding_entity.dart';

class PageViewItem extends StatefulWidget {
  const PageViewItem({super.key, required this.onBoardingEntity});
  final OnBoardingEntity onBoardingEntity;

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(widget.onBoardingEntity.img),
            SizedBox(
              height: 56.h,
            ),
            SizedBox(
                width: context.screenWidth * 0.9,
                child: Text(
                  widget.onBoardingEntity.title,
                  style: AppTextStyles.text20Medium.copyWith(height: 1.3),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
                width: context.screenWidth * 0.8,
                child: Text(
                  widget.onBoardingEntity.subtitle,
                  style: AppTextStyles.text16Regular
                      .copyWith(color: AppColors.darkGray, height: 1.3.h),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
