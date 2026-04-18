import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/details_text.dart';
import 'package:qodraapp/generated/l10n.dart';

class NameAndAdressOfWorkShop extends StatelessWidget {
  const NameAndAdressOfWorkShop({
    super.key,
    required this.workShopEntity,
  });
  final WorkShopEntity workShopEntity;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            workShopEntity.name ?? S.of(context).Unknown,
            style: AppTextStyles.text16Medium,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              SvgPicture.asset(Assets.imagesLocationIcon),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                  child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                workShopEntity.address ?? S.of(context).Unknown,
                style: AppTextStyles.text12Regular
                    .copyWith(color: AppColors.darkGray),
              )),
              /* Expanded(
                child: DetailsAndOpeninigOfWorkshop(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RoutesName.workshopDetailsScreen,
                        arguments: workShopEntity);
                  },
                ),
              ), */
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: DetalisText(
                  onTap: (){
                      Navigator.pushNamed(
                        context, RoutesName.workshopDetailsScreen,
                        arguments: workShopEntity);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
