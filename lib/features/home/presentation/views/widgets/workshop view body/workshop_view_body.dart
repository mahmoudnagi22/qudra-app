import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/widgets/custom_app_bar.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/workshop%20view%20body/workshop_info_container.dart';
import 'package:qodraapp/generated/l10n.dart';

class WorkShopViewBody extends StatelessWidget {
  const WorkShopViewBody({super.key, required this.workShopEntity});
  final WorkShopEntity workShopEntity ; 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            txt: S.of(context).workshopDetails,
            onTap: () {
              Navigator.pop(context);
            },
          ),
           WorkShopInfoContainer(workShopEntity: workShopEntity,),
          SizedBox(
            height: 32.h,
          ),
        ],
      ),
    );
  }
}
