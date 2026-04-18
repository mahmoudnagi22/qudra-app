import 'package:hive/hive.dart';
import 'package:qodraapp/features/home/domain/entities/user_info_entity.dart';

@HiveType(typeId: 0)
class UserInfoModel extends UserInfoEntity {
  String? email;
  String? phone;
  String? whats;
  String? notes;

  UserInfoModel({
    required this.email,
    required this.phone,
    required this.whats,
    required this.notes,
    required super.name,
    required super.rank,
    required super.numOfSessions,
  });

  @override
  String toString() {
    return '(name: $name, email: $email, phone: $phone, whats: $whats, notes: $notes, rank: $rank, numOfSessions: $numOfSessions)';
  }

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        whats: json["whats"],
        notes: json["notes"], 
        rank: json["rank"],
        numOfSessions: json["numOfSession"],
        );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'whats': whats,
        'notes': notes, 
        'rank': rank,
        'numOfSessions': numOfSessions,
      };
}
