import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/car_name.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/service%20history%20view%20body/oil_type_and_km.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/service%20history%20view%20body/price_container.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/service%20history%20view%20body/service_date_and_num.dart';
import 'package:qodraapp/generated/l10n.dart';

import '../workshop view body/service_description_box.dart';

class ServiceHistoryItem extends StatefulWidget {
  const ServiceHistoryItem({
    super.key,
    required this.serviceEntity,
    required this.serviceNum,
  });

  final ServiceEntity serviceEntity;
  final int serviceNum;

  @override
  State<ServiceHistoryItem> createState() => _ServiceHistoryItemState();
}

class _ServiceHistoryItemState extends State<ServiceHistoryItem> {
  final List<String> serviceNameList = [];
  String serviceName = '';

  String getServiceName() {
    serviceNameList.clear();

    if (widget.serviceEntity.oilChanged == true) {
      serviceNameList.add('تغيير زيت المحرك');
    }

    if (widget.serviceEntity.filterChanged == true) {
      serviceNameList.add('تم تغيير فلتر الزيت');
    }

    final additionalServices = widget.serviceEntity.additionalServices;
    if (additionalServices != null && additionalServices.isNotEmpty) {
      serviceNameList.addAll(additionalServices);
    }

    serviceName = serviceNameList.join(' + ');
    return serviceName;
  }

  @override
  void initState() {
    super.initState();
    getServiceName();
  }

  @override
  Widget build(BuildContext context) {
    final desc = (widget.serviceEntity.description ?? '').trim();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1, color: AppColors.main),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CarName(
                txt: widget.serviceEntity.carModel ?? S.of(context).Unknown,
              ),
              SizedBox(height: 24.h),
              Text(
                serviceName.isEmpty ? S.of(context).Unknown : serviceName,
                style: AppTextStyles.text16Medium.copyWith(height: 1.5.h),
              ),

              SizedBox(height: 16.h),

              (widget.serviceEntity.oilChanged == true)
                  ? OilTypeAndKMColumn(
                serviceNum: widget.serviceNum,
                serviceEntity: widget.serviceEntity,
              )
                  : ServiceDateAndNum(
                serviceNum: widget.serviceNum,
                serviceEntity: widget.serviceEntity,
              ),
              if (desc.isNotEmpty) ...[
                ServiceDescriptionBox(description: desc),
                SizedBox(height: 12.h),
              ],

              PriceContainer(serviceEntity: widget.serviceEntity),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
