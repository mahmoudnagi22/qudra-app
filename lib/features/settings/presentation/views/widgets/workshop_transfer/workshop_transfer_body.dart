import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/widgets/custom_app_bar.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/workshop_transfer/transfer_container.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/workshop_transfer/work_shop_transfer_desc.dart';
import 'package:qodraapp/generated/l10n.dart';

class WorkShopTransferViewBody extends StatefulWidget {
  const WorkShopTransferViewBody({super.key});

  @override
  State<WorkShopTransferViewBody> createState() =>
      _WorkShopTransferViewBodyState();
}

class _WorkShopTransferViewBodyState extends State<WorkShopTransferViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            txt: S.of(context).workshop_transfer_title,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const WorkshopTransferDesc(),
          SizedBox(
            height: 16.h,
          ),
          const TransferContainer(),
        ],
      ),
    );
  }
}
