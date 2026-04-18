import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class WorkShopInfoListTile extends StatelessWidget {
  const WorkShopInfoListTile({
    super.key,
    required this.txt1,
    required this.txt2,
    required this.photo,
    this.onTap,
  });

  final String txt1;
  final String txt2;
  final String photo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(txt1, style: AppTextStyles.text16Medium),
      subtitle: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Text(txt2, style: AppTextStyles.text14Medium.copyWith(height: 1.5.h)),
      ),
      trailing: SizedBox(
        height: 24.h,
        width: 24.w,
        child: SvgPicture.asset(photo, fit: BoxFit.contain),
      ),
    );
  }
}
