import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/generated/l10n.dart';

class NotificationSettingTitle extends StatelessWidget {
  const NotificationSettingTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.imagesBell,
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(S.of(context).NotificationSettings,
              style: AppTextStyles.text18Medium),
        ],
      ),
    );
  }
}
