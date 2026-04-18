import 'package:qodraapp/features/home/domain/entities/user_info_entity.dart';

abstract class Userinfostates {}

class UserInfoInitialState extends Userinfostates {}

class UserInfoLoadingState extends Userinfostates {}

class UserInfoSucsessState extends Userinfostates {
  UserInfoEntity userInfoEntity;
  UserInfoSucsessState(this.userInfoEntity);
}

class UserInfoErrorState extends Userinfostates {
  final String message;
  UserInfoErrorState(this.message);
}
