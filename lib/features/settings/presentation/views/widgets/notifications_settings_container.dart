import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/notification_settings_row.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/notification_settings_tittle.dart';
import 'package:qodraapp/generated/l10n.dart';

class NotificationSettingsContainer extends StatelessWidget {
  const NotificationSettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [AppShadows.dropShadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const NotificationSettingTitle(),
            SizedBox(
              height: 16.h,
            ),
            NotifySettingRow(
              text1: S.of(context).notification_sound,
              text2: S.of(context).maintenance_reminder_desc,
            ),
            NotifySettingRow(
              text1: S.of(context).special_offers,
              text2: S.of(context).special_offers_desc,
            ),
            NotifySettingRow(
              text1: S.of(context).news,
              text2: S.of(context).news_desc,
            ),
          ],
        ),
      ),
    );
  }
}
