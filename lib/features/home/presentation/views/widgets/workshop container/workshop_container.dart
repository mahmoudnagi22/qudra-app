import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/widgets/name_address_workshop.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkShopContainer extends StatelessWidget {
  const WorkShopContainer({super.key, required this.isLoading, required this.workShopEntity});
  final bool isLoading ; 
  final WorkShopEntity workShopEntity ; 
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [AppShadows.dropShadow],
            color: AppColors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 5.h),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: Image.asset(
                      Assets.imagesWorkshop,
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  width: 20.w,
                ),
                 NameAndAdressOfWorkShop(
                  workShopEntity: workShopEntity , 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
