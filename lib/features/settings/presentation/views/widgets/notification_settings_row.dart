import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';

class NotifySettingRow extends StatefulWidget {
  const NotifySettingRow({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;

  @override
  State<NotifySettingRow> createState() => _NotifySettingRowState();
}

class _NotifySettingRowState extends State<NotifySettingRow> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text1,
                  style: AppTextStyles.text16Medium,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  widget.text2,
                  style: AppTextStyles.text14Medium
                      .copyWith(color: AppColors.darkGray),
                ),
              ],
            ),
          ),
          CupertinoSwitch(
            value: isSwitched,
            onChanged: (val) {
              isSwitched = !isSwitched;
              setState(() {});
            },
            activeTrackColor: AppColors.main,
            inactiveThumbColor: AppColors.mainLight,
            inactiveTrackColor: AppColors.platinumRank,
          ),
        ],
      ),
    );
  }
}
