import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/row_of_check_box_password_rules.dart';
import 'package:qodraapp/generated/l10n.dart';

class RulesOfPasswordContainer extends StatelessWidget {
  const RulesOfPasswordContainer(
      {super.key,
      required this.ch1,
      required this.ch2,
      required this.ch3,
      required this.ch4});
  final bool ch1, ch2, ch3, ch4;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            AppShadows.dropShadow,
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Text(
                S.of(context).passwordRules,
                style: AppTextStyles.text16Medium,
              ),
            ),
            RowOfcheckBoxPasswordRules(
              txt: S.of(context).atLeast8Characters,
              checkBool: ch1,
            ),
            RowOfcheckBoxPasswordRules(
              txt: S.of(context).atLeastOneUppercase,
              checkBool: ch2,
            ),
            RowOfcheckBoxPasswordRules(
              txt: S.of(context).atLeastOneNumber,
              checkBool: ch3,
            ),
            RowOfcheckBoxPasswordRules(
                checkBool: ch4, txt: S.of(context).atLeastOneSpecialCharacter),
          ],
        ),
      ),
    );
  }
}
