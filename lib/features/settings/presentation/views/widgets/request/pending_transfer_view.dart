import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/functions/show_success_dialog.dart';
import 'package:qodraapp/core/functions/show_warning_dialog.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/widgets/custom_app_bar.dart';
import 'package:qodraapp/core/widgets/custom_text_button.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/request/request_text.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/request/source_workshop.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/request/support_contact.dart';
import 'package:qodraapp/generated/l10n.dart';

class PendingTransferViewBody extends StatelessWidget {
  const PendingTransferViewBody({super.key});

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
              cancelOrder(context);
            },
          ),
          RequestText(
            color: AppColors.yellow,
            txt: S.of(context).order_review_message,
            border: null,
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
                text: S.of(context).cancel_order,
                onPressed: () {
                  cancelOrder(context);
                }),
          ),
          const SupportContactWidget(),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }

  //-----------------------------------------------------------
  void cancelOrder(BuildContext context) {
    showWarningDialog(context, accept: () {
      Navigator.pop(context);
      showSuccessDialog(context, accept: () {
        Navigator.pop(context); // بقفل الدايلوج
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, RoutesName.workShopTransfer);
      }, txt: S.of(context).transfer_cancelled_success);
    }, reject: () {
      Navigator.pop(context);
    }, txt: S.of(context).cancel_transfer_warning);
  }
}
