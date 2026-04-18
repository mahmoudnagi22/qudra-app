import 'dart:ui';

import 'package:hive/hive.dart';
part 'notification_entity.g.dart';
@HiveType(typeId: 5)
class NotificationEntity {
  @HiveField(0)
  final int? type;
  @HiveField(1)
  final Color? color;
  @HiveField(2)
  final String txt;
  NotificationEntity({required this.txt, this.color, this.type});

  factory NotificationEntity.fromJson(data) {
    return NotificationEntity(txt: data['message']);
  }
}
