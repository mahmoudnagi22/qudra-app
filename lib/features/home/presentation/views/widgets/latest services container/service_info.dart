import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class SreviceInfo extends StatelessWidget {
  const SreviceInfo({
    super.key,
    required this.serviceInfo,
    required this.dateOfService,
  });

  final String serviceInfo;
  final String dateOfService;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            serviceInfo,
            style: AppTextStyles.text16Medium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(dateOfService,
                  style: AppTextStyles.text14Regular.copyWith(
                    color: AppColors.darkGray,
                  )))
        ],
      ),
    );
  }
}
