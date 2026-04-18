import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/generated/l10n.dart';

class OilChangeReminderContainer extends StatelessWidget {
  const OilChangeReminderContainer({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [AppShadows.dropShadow],
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.yellow,
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 18.h,
                    width: 18.w,
                    child: Image.asset(Assets.imagesWarning),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Flexible(
                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).oilReminderDate(txt),
                    style: AppTextStyles.text14Medium,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
