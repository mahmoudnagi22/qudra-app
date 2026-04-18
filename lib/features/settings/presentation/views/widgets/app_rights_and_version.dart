import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/generated/l10n.dart';

class AppRightsVersion extends StatelessWidget {
  const AppRightsVersion({
    super.key,
    required this.version,
  });
  final String version;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(
            S.of(context).app_version(version),
            style:
                AppTextStyles.text14Medium.copyWith(color: AppColors.darkGray),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            S.of(context).all_rights_reserved,
            style:
                AppTextStyles.text14Medium.copyWith(color: AppColors.darkGray),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
