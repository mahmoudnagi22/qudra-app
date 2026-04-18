import 'package:hive/hive.dart';
part 'user_info_entity.g.dart';

@HiveType(typeId: 0)
class UserInfoEntity {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int? rank;
  @HiveField(2)
  final int? numOfSessions;
  UserInfoEntity({
    required this.name,
    required this.rank,
    required this.numOfSessions,
  });
}
//
