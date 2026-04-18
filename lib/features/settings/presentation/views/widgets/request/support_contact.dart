import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/widgets/custom_text_button.dart';
import 'package:qodraapp/generated/l10n.dart';

class SupportContactWidget extends StatelessWidget {
  const SupportContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [AppShadows.dropShadow],
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Text(
                S.of(context).contact_support,
                style: AppTextStyles.text16Medium,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomTextButton(
                text: S.of(context).whatsapp,
                onPressed: () {},
                isOutlined: true,
                icon: Assets.imagesSupportContact,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
