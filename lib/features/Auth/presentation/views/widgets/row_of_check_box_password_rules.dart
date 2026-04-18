import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/custom_check_box.dart';

class RowOfcheckBoxPasswordRules extends StatefulWidget {
  const RowOfcheckBoxPasswordRules(
      {super.key, required this.txt, required this.checkBool});
  final String txt;
  final bool checkBool;

  @override
  State<RowOfcheckBoxPasswordRules> createState() =>
      _RowOfcheckBoxPasswordRulesState();
}

class _RowOfcheckBoxPasswordRulesState
    extends State<RowOfcheckBoxPasswordRules> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: CustomCheckBox(
            checkBool: widget.checkBool,
          ),
        ),
        Text(
          widget.txt,
          style: AppTextStyles.text12Regular,
        ),
      ],
    );
  }
}
