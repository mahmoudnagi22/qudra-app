import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';

abstract class WorkShopInfoStates {}

class WorkShopInfoInitailState extends WorkShopInfoStates {}

class WorkShopInfoLoadingState extends WorkShopInfoStates {}

class WorkShopInfoSucsessState extends WorkShopInfoStates {
  WorkShopEntity workShopEntity;
  WorkShopInfoSucsessState(this.workShopEntity);
}

class WorkShopInfoErrorState extends WorkShopInfoStates {
  final String message;
  WorkShopInfoErrorState(this.message);
}
