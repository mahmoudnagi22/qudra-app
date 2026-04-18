import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/latest%20services%20container/price_of_services.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/latest%20services%20container/service_info.dart';

class LastVisitSummaryContainer extends StatelessWidget {
  const LastVisitSummaryContainer(
      {super.key,
      required this.serviceInfo,
      required this.price,
      required this.dateOfService});
  final String serviceInfo;
  final String price;
  final String dateOfService;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 1, color: AppColors.main),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Row(
            children: [
              SreviceInfo(
                  serviceInfo: serviceInfo, dateOfService: dateOfService),
              PriceOfService(price: price),
            ],
          ),
        ),
      ),
    );
  }
}
