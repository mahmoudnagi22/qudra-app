import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/change_lang/custom_pop_up_menu.dart';
import 'package:qodraapp/generated/l10n.dart';

class LangSettings extends StatelessWidget {
  const LangSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).language,
            style: AppTextStyles.text16Medium,
          ),
          const CustomPopUpMenu(),
        ],
      ),
    );
  }
}
