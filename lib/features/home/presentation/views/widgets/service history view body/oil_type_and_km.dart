import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/service%20history%20view%20body/service_date_and_num.dart';
import 'package:qodraapp/generated/l10n.dart';

class OilTypeAndKMColumn extends StatelessWidget {
  const OilTypeAndKMColumn({
    super.key,
    required this.serviceEntity,
    required this.serviceNum,
  });
  final ServiceEntity serviceEntity;
  final int serviceNum;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).usedOil,
                    style: AppTextStyles.text14Regular
                        .copyWith(color: AppColors.darkGray)),
                Flexible(
                  child: Text(
                      textAlign: TextAlign.end,
                      serviceEntity.oilType ?? S.of(context).Unknown,
                      style: AppTextStyles.text14Regular
                          .copyWith(color: AppColors.darkGray)),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).kilometersCount,
                    style: AppTextStyles.text14Regular
                        .copyWith(color: AppColors.darkGray)),
                Flexible(
                  child: Text('${serviceEntity.numberOfKilometers}',
                      style: AppTextStyles.text14Regular
                          .copyWith(color: AppColors.darkGray)),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        ServiceDateAndNum(
          serviceNum: serviceNum,
          serviceEntity: serviceEntity,
        ),
      ],
    );
  }
}
