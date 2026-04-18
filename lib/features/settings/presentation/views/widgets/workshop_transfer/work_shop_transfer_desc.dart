import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/generated/l10n.dart';

class WorkshopTransferDesc extends StatelessWidget {
  const WorkshopTransferDesc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              S.of(context).workshop_transfer_desc,
              style: AppTextStyles.text16Regular,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
