import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/features/home/domain/entities/nav_bar_entity.dart';

class ActiveNavBarIcon extends StatelessWidget {
  const ActiveNavBarIcon({super.key, required this.navBarEntity});
  final NavBarEntity navBarEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
            height: 20.h,
            width: 20.w,
            child: SvgPicture.asset(
              navBarEntity.activeIcon,
              fit: BoxFit.contain,
            )),
        SizedBox(
          height: 5.h,
        ),
        Text(
          navBarEntity.title,
          style: AppTextStyles.text12Regular.copyWith(color: AppColors.main),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }
}
