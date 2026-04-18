import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class CarName extends StatelessWidget {
  const CarName({
    super.key,
    required this.txt,
  });
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            txt,
            style: AppTextStyles.text16Medium,
          ),
        ),
        SizedBox(
            height: 40.h,
            width: 40.w,
            child: Image.asset(Assets.imagesCarIcon)),
      ],
    );
  }
}
