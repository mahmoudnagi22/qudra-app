import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/widgets/custom_app_bar.dart';
import 'package:qodraapp/core/widgets/custom_text_button.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/request/request_text.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/request/source_workshop.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/request/support_contact.dart';
import 'package:qodraapp/generated/l10n.dart';

class AcceptRequestViewBody extends StatelessWidget {
  const AcceptRequestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final EdgeInsets edgeInsets =
        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            txt: S.of(context).workshop_transfer,
            onTap: () {
               Navigator.pop(context);
               Navigator.pop(context);
            },
          ),
          RequestText(
            color: AppColors.white,
            txt: S.of(context).transfer_request_accepted,
            border: Border.all(color: AppColors.green),
          ),
          Padding(
            padding: edgeInsets,
            child: Text(
              S.of(context).transfer_from,
              style: AppTextStyles.text16Medium,
            ),
          ),
          const SourceDestWorkshopWidget(
            name: 'اوتو فيكس للخدمات',
            address: 'مدينة نصر القاهرة',
          ),
          SizedBox(
            height: 32.h,
          ),
          Center(child: SvgPicture.asset(Assets.imagesTransfer)),
          Padding(
            padding: edgeInsets,
            child: Text(
              S.of(context).transfer_to,
              style: AppTextStyles.text16Medium,
            ),
          ),
          const SourceDestWorkshopWidget(
            name: 'ورشة النهضة للصيانة',
            address: 'فيصل القاهرة ',
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: edgeInsets,
            child: CustomTextButton(
                text: S.of(context).cancel_order, onPressed: () {}),
          ),
          const SupportContactWidget(),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
