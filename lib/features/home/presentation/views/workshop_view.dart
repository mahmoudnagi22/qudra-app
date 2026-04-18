import 'package:flutter/material.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/workshop%20view%20body/workshop_view_body.dart';

class WorkShopView extends StatelessWidget {
  const WorkShopView({super.key, required this.workShopEntity});
  final WorkShopEntity workShopEntity ; 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: WorkShopViewBody(workShopEntity: workShopEntity,),
    );
  }
}
