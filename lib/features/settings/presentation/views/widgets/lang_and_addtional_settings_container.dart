import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/addtional_settings_row.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/change_lang/lang_settings.dart';
import 'package:qodraapp/generated/l10n.dart';

class LangAndAddetionalSettingsContainer extends StatelessWidget {
  const LangAndAddetionalSettingsContainer({super.key});

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
              const LangSettings(),
              AdditonalSettingsRow(
                txt: S.of(context).changePassword,
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.forgotPasswordScreen);
                },
              ),
              AdditonalSettingsRow(
                txt: S.of(context).workshop_transfer,
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.workShopTransfer);
                },
              ),
            ],
          )),
    );
  }
}
