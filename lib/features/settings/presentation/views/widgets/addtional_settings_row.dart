import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class AdditonalSettingsRow extends StatelessWidget {
  const AdditonalSettingsRow(
      {super.key, required this.txt, required this.onTap});
  final String txt;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Row(
          children: [
            Text(
              txt,
              style: AppTextStyles.text16Medium,
              textAlign: TextAlign.start,
            ),
            const Spacer(),
            Icon(isRtl
                ? CupertinoIcons.chevron_left
                : CupertinoIcons.chevron_right),
          ],
        ),
      ),
    );
  }
}
