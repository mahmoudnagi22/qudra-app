import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/car_name.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/car_row_details.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/details_text.dart';
import 'package:qodraapp/generated/l10n.dart';

class CarContainer extends StatelessWidget {
  const CarContainer({
    super.key,
    required this.carsInfoEntity,
  });
  final CarsInfoEntity carsInfoEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [AppShadows.dropShadow],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:  CrossAxisAlignment.end,
            children: [
              CarName(
                txt: '${carsInfoEntity.make} ${carsInfoEntity.carModel}',
              ),
              SizedBox(
                height: 10.h,
              ),
              CarRowDatails(
                  txt1: S.of(context).model, txt2: '${carsInfoEntity.year}'),
              SizedBox(
                height: 10.h,
              ),
              CarRowDatails(
                  txt1: S.of(context).plateNumber,
                  txt2: carsInfoEntity.plateNumber ?? S.of(context).Unknown),
              SizedBox(
                height: 10.h,
              ),
              CarRowDatails(
                  txt1: S.of(context).oilType, txt2: carsInfoEntity.oilType ?? S.of(context).Unknown),
              const Spacer(),
              DetalisText(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.carDetailsScreen,
                      arguments: carsInfoEntity);
                },
              ) 
            ],
          ),
        ),
      ),
    );
  }
}
