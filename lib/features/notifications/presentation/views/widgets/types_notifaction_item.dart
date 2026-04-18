import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/features/notifications/domain/entites/notification_container_entity.dart';
import 'package:qodraapp/features/notifications/presentation/views/widgets/notification_type_container.dart';

class TypesNotificationRow extends StatefulWidget {
  const TypesNotificationRow(
      {super.key, required this.isSelected, required this.onTap});
  final int isSelected;
  final void Function(int) onTap;

  @override
  State<TypesNotificationRow> createState() => _TypesNotificationRowState();
}

class _TypesNotificationRowState extends State<TypesNotificationRow> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: getNotifactionItems(context).asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {
                  widget.onTap(entry.key);
                },
                child: NotificationTypeContainer(
                  isChecked: widget.isSelected == entry.key,
                  text: entry.value.title,
                  icon: entry.value.icon,
                ),
              );
            }).toList()),
      ),
    );
  }
}
