import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/widgets/custom_app_bar.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/car%20details%20view%20body/AllCarDetails.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/oil_change_reminder.dart';
import 'package:qodraapp/generated/l10n.dart';

class CarDetailsViewBody extends StatelessWidget {
  const CarDetailsViewBody({
    super.key, required this.carsInfoEntity,
  });

  final CarsInfoEntity carsInfoEntity ; 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          CustomAppBar(
            txt: S.of(context).CarDetailsScreenTitle,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          AllCarDetails(
            carsInfoEntity: carsInfoEntity,
          ),
          SizedBox(
            height: 10.h,
          ),
          carsInfoEntity.nextChange !=0  &&  carsInfoEntity.nextChange !=null ?
          OilChangeReminderContainer(
              txt:
                  '${carsInfoEntity.nextChange} ${S.of(context).Km}') : const SizedBox.shrink(),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}