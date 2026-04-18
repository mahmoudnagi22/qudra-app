import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/features/notifications/domain/entites/notification_entity.dart';
import 'package:qodraapp/features/notifications/presentation/views/widgets/notification_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingWidgetList extends StatefulWidget {
  const LoadingWidgetList({super.key, required this.color, });
  final Color color ;

  @override
  State<LoadingWidgetList> createState() => _LoadingWidgetListState();
}

class _LoadingWidgetListState extends State<LoadingWidgetList> {
  List<NotificationEntity> testData = [
    NotificationEntity(txt: 'Test', color: AppColors.main),
    NotificationEntity(txt: 'Test', color:AppColors.goldRank),
    NotificationEntity(txt: 'Test', color: AppColors.green),
    NotificationEntity(txt: 'Test', color: AppColors.darkGray),
    NotificationEntity(txt: 'Test', color: AppColors.main),
    NotificationEntity(txt: 'Test', color: AppColors.goldRank),
    NotificationEntity(txt: 'Test', color: AppColors.green),
    NotificationEntity(txt: 'Test', color: AppColors.darkGray),
    NotificationEntity(txt: 'Test', color: AppColors.main),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        enabled: true,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: testData.length,
            itemBuilder: (context, index) {
              return  NotificationItem(
                txt: 'حان وقت تغيير الزيت! حافظ على أداء محركك المثالي.',
                color: widget.color == AppColors.main ? testData[index].color! : widget.color 
              );
            }),
      ),
    );
  }
}
