import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/widgets/name_address_workshop.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';

class SourceDestWorkshopWidget extends StatelessWidget {
  const SourceDestWorkshopWidget(
      {super.key, required this.name, required this.address});
  final String name;
  final String address;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 112.h,
        decoration: BoxDecoration(
          boxShadow: const [AppShadows.dropShadow],
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Row(
            children: [
              SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Image.asset(
                    Assets.imagesWorkshop,
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                width: 10.w,
              ),
              NameAndAdressOfWorkShop(workShopEntity: WorkShopEntity(
                name: name ,
                address: address
              ))
            ],
          ),
        ),
      ),
    );
  }
}
