import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/presentation/manager/car_service_info/car_service_info_cubit.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/car_name.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/car_row_details.dart';
import 'package:qodraapp/generated/l10n.dart';

class AllCarDetails extends StatelessWidget {
  const AllCarDetails({
    super.key,
    required this.carsInfoEntity,
  });

  final CarsInfoEntity carsInfoEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [AppShadows.dropShadow],
        ),
        child: Padding(
          padding: edgeInsets,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CarName(txt: carsInfoEntity.carModel ?? S.of(context).Unknown),
              SizedBox(
                height: 20.h,
              ),
              CarRowDatails(
                txt1: S.of(context).model,
                txt2: carsInfoEntity.make ?? S.of(context).Unknown,
                textStyle: AppTextStyles.text16Medium,
              ),
              SizedBox(
                height: 20.h,
              ),
              CarRowDatails(
                  txt1: S.of(context).plateNumber,
                  txt2: carsInfoEntity.plateNumber ?? S.of(context).Unknown,
                  textStyle: AppTextStyles.text16Medium),
              SizedBox(
                height: 20.h,
              ),
              CarRowDatails(
                  txt1: S.of(context).currentKilometers,
                  txt2: '${carsInfoEntity.currentKm ?? S.of(context).Unknown}',
                  textStyle: AppTextStyles.text16Medium),
              SizedBox(
                height: 20.h,
              ),
              CarRowDatails(
                  txt1: S.of(context).oilType,
                  txt2: carsInfoEntity.oilType ?? S.of(context).Unknown,
                  textStyle: AppTextStyles.text16Medium),
              SizedBox(
                height: 20.h,
              ),
              CarRowDatails(
                  txt1: S.of(context).lastOilChange,
                  txt2: carsInfoEntity.lastChange != null
                      ? DateFormat('yMMMMd')
                          .format(DateTime.parse(carsInfoEntity.lastChange!))
                      : "S.of(context).Unknown",
                  textStyle: AppTextStyles.text16Medium),
              SizedBox(
                height: 20.h,
              ),
              CarRowDatails(
                  txt1: S.of(context).nextChangeAfter,
                  txt2: '${carsInfoEntity.nextChange ?? S.of(context).Unknown}',
                  textStyle: AppTextStyles.text16Medium),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () async {
                  String? token =
                      await SecurePrefs.getString(tokenSecureKey);
                  if (token != null && carsInfoEntity.id != null) {
                    BlocProvider.of<LatestServicesCubitOfCar>(context)
                        .getLatestServicesInfoOfCar(
                            token: token, carId: carsInfoEntity.id!);
                  }
                },
                child: Text(
                  textAlign: TextAlign.end,
                  S.of(context).viewMaintenanceHistory,
                  style: AppTextStyles.text12Regular
                      .copyWith(color: AppColors.main),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
