import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/presentation/helpers/get_service_name_fun.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/latest%20services%20container/last_visits_summary_container.dart';
import 'package:qodraapp/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:intl/intl.dart';

class LatestServices extends StatefulWidget {
  const LatestServices({
    super.key,
    required this.isLoading,
    required this.sessionsList,
  });
  final bool isLoading;
  final List<ServiceEntity> sessionsList;

  @override
  State<LatestServices> createState() => _LatestServicesState();
}

class _LatestServicesState extends State<LatestServices> {
  @override
  Widget build(BuildContext context) {
    String name1 = '';
    String name2 = '';

    if (widget.sessionsList.isNotEmpty) {
      name1 = getServiceName(
        serviceEntity: widget.sessionsList.last,
      );

      if (widget.sessionsList.length > 1) {
        name2 = getServiceName(
          serviceEntity: widget.sessionsList[widget.sessionsList.length - 2],
        );
      }
    }
    return Skeletonizer(
      enabled: widget.isLoading,
      child: Padding(
        padding: edgeInsets,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: const [AppShadows.dropShadow],
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Row(
                  children: [
                    Text(
                      S.of(context).LatestServices,
                      style: AppTextStyles.text16Medium,
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, RoutesName.servicesHistoryScreen,
                            arguments: {'sessionsList': widget.sessionsList}),
                        child: Text(
                          S.of(context).ViewAll,
                          style: AppTextStyles.text14Medium
                              .copyWith(color: AppColors.main),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              if (widget.sessionsList.isNotEmpty)
                LastVisitSummaryContainer(
                  serviceInfo: name1,
                  price:
                      '${widget.sessionsList[widget.sessionsList.length - 1].cost!.toStringAsFixed(2)} ${S.of(context).EGP}',
                  dateOfService:
                   widget.sessionsList[widget.sessionsList.length - 1].date != null ?
                   DateFormat('yMMMMd').format(DateTime.parse(
                      widget
                          .sessionsList[widget.sessionsList.length - 1].date!)) : S.of(context).Unknown,
                ),
              SizedBox(
                height: 16.h,
              ),
              widget.sessionsList.isNotEmpty
                  ? (widget.sessionsList.length > 1
                      ? LastVisitSummaryContainer(
                          serviceInfo: name2,
                          price:
                              '${widget.sessionsList[widget.sessionsList.length - 2].cost!.toStringAsFixed(2)} ${S.of(context).EGP}',
                          dateOfService: 
                          widget.sessionsList[widget.sessionsList.length - 2].date != null ?
                          DateFormat('yMMMMd').format(
                              DateTime.parse(widget
                                  .sessionsList[widget.sessionsList.length - 2]
                                  .date!)) : S.of(context).Unknown,
                        )
                      : const SizedBox.shrink())
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

//pass data to list view
//cache data
