import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/generated/l10n.dart';

class ServiceDateAndNum extends StatelessWidget {
  const ServiceDateAndNum({
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
        Row(
          children: [
            Text(
              serviceEntity.date != null ?
                DateFormat('yMMMMd')
                    .format(DateTime.parse(serviceEntity.date!)) : S.of(context).Unknown,
                style: AppTextStyles.text14Regular
                    .copyWith(color: AppColors.darkGray)),
            const Spacer(),
            Text(S.of(context).visitNumber(serviceNum),
                style: AppTextStyles.text14Regular
                    .copyWith(color: AppColors.darkGray)),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
