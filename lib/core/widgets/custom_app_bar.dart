import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.txt,
    required this.onTap,
  });
  final String txt;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                Assets.imagesArrowIcon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                txt,
                style: AppTextStyles.text18Medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
