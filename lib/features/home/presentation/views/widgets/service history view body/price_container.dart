import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/generated/l10n.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    super.key,
    required this.serviceEntity,
  });

  final ServiceEntity serviceEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 32.h,
      decoration: BoxDecoration(
        boxShadow: const [AppShadows.dropShadow],
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.white,
      ),
      child: Center(
          child: Text(
          serviceEntity.cost != null ?
        '${serviceEntity.cost!.toStringAsFixed(2)} ${S.of(context).EGP}' : S.of(context).Unknown,
        style: AppTextStyles.text16Medium,
      )),
    );
  }
}
