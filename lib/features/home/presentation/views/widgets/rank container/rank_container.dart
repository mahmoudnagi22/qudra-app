import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/wisdom_text.dart';
import 'package:qodraapp/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';
class RankContainer extends StatelessWidget {
  const RankContainer({
    super.key,
    required this.visits, required this.rankType, required this.colorRank, required this.txt, required this.photo, required this.isLoading,
  });

  final int visits;
  final String rankType  ; 
  final Color colorRank ; 
  final String txt ; 
  final String photo ;
  final bool isLoading ; 

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [AppShadows.dropShadow],
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rankType,
                          style: AppTextStyles.text14Medium,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          S.of(context).visitCount(visits),
                          style: AppTextStyles.text12Regular
                              .copyWith(color: AppColors.darkGray),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: Image.asset(photo)),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                 WisdomText(
                  txt: txt,
                  colorRank: colorRank,
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
