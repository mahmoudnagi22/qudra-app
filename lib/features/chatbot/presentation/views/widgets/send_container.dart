import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/constants.dart';

class SendContainer extends StatelessWidget {
  const SendContainer({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      width: 46.w,
      decoration: boxDecoration.copyWith(color: AppColors.main),
      child: SizedBox(
          height: 24.h,
          width: 24.w,
          child: TextButton(
              onPressed: onPressed,
              child: Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.white,
                textDirection: Directionality.of(context),
              ))),
    );
  }
}
