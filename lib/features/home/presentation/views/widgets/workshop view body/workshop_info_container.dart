import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/functions/error_bar_function.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/workshop%20view%20body/custom_text_button_workshop.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/workshop%20view%20body/name_opening_workshop%20row.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/workshop%20view%20body/workshop_info_listTile.dart';
import 'package:qodraapp/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/utlis/formatEgyptWhatsApp.dart';

class WorkShopInfoContainer extends StatefulWidget {
  const WorkShopInfoContainer({super.key, required this.workShopEntity});
  final WorkShopEntity workShopEntity;

  @override
  State<WorkShopInfoContainer> createState() => _WorkShopInfoContainerState();
}

class _WorkShopInfoContainerState extends State<WorkShopInfoContainer> {
  String services = '';
  String getAvaliableServices() {
    List<dynamic>? list = widget.workShopEntity.serviceTypes;
    services = list == null ? '' : list.join('_');
    return services;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAvaliableServices();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [AppShadows.dropShadow],
        ),
        child: Column(
          children: [
            NameAndOpeningRow(
              workshopName: widget.workShopEntity.name!,
            ),
            SizedBox(
              height: 16.h,
            ),
            WorkShopInfoListTile(
              txt1: S.of(context).address,
              txt2: widget.workShopEntity.address ?? "لا يوجد",
              photo: Assets.imagesLocationBlack,
            ),
            WorkShopInfoListTile(
              txt1: S.of(context).phoneNumber,
              txt2: widget.workShopEntity.phoneNumber!,
              photo: Assets.imagesDeviceBlack,
            ),
            WorkShopInfoListTile(
              txt1: S.of(context).whatsapp,
              txt2: widget.workShopEntity.whats ?? "لا يوجد",
              photo: Assets.imagesChatBlack,
              onTap: () {
                final w = widget.workShopEntity.whats;
                if (w != null && w.isNotEmpty) openWhatsApp(w);
              },
            ),

            WorkShopInfoListTile(
              txt1: S.of(context).workingHours,
              txt2: '${widget.workShopEntity.workingHours}',
              photo: Assets.imagesTimeBlack,
            ),
            WorkShopInfoListTile(
              txt1: S.of(context).availableServices,
              txt2: services.isEmpty ? 'لا يوجد معلومات' : services,
              photo: Assets.imagesServicesBlack,
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              endIndent: 30.w,
              indent: 30.w,
              color: AppColors.main,
              thickness: 1,
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(
                      child: CustomTextButtonWorkshop(
                    txt: S.of(context).call,
                    onPressed: () {
                      if (widget.workShopEntity.phoneNumber != null) {
                        openDialer();
                      }
                    },
                    photo: Assets.imagesDeviceBlack,
                  )),
                  Expanded(
                      child: CustomTextButtonWorkshop(
                    txt: S.of(context).whatsapp,
                    onPressed: () {
                      if (widget.workShopEntity.whats != null) {
                        openWhatsApp(widget.workShopEntity.whats!);
                      }
                    },
                    photo: Assets.imagesChatBlack,
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openDialer() async {
    if (widget.workShopEntity.phoneNumber != null) {
      final telUri =
          Uri(scheme: 'tel', path: '+2${widget.workShopEntity.phoneNumber!}');

      if (await canLaunchUrl(telUri)) {
        await launchUrl(telUri);
      } else {
        buildErrorBar(context, S.of(context).dialer);
      }
    }
  }

  Future<void> openWhatsApp(String phone, {String message = ""}) async {
    final formatted = formatEgyptWhatsApp(phone);
    final uri = Uri.parse(
      "https://wa.me/$formatted?text=${Uri.encodeComponent(message)}",
    );

    debugPrint("WHATSAPP URI => $uri");

    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      buildErrorBar(context, S.of(context).download_whatsapp);
    }
  }
}
