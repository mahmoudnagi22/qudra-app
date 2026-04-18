import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class NameAndOpeningRow extends StatelessWidget {
  const NameAndOpeningRow({
    super.key,
    required this.workshopName,
  });
  final String workshopName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 40.h,
              width: 40.w,
              child: Image.asset(Assets.imagesWorkshop)),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workshopName,
                  style: AppTextStyles.text16Medium,
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
