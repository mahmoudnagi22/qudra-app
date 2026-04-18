import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/widgets/custom_dots_indicator.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/car%20details%20container/page_view_car_container.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/oil_change_reminder.dart';
import 'package:qodraapp/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CarsData extends StatefulWidget {
  const CarsData({
    super.key,
    required this.carsList,
    required this.isLoading,
  });
  final List<CarsInfoEntity> carsList;
  final bool isLoading;

  @override
  State<CarsData> createState() => _CarsDataState();
}

class _CarsDataState extends State<CarsData> {
  int currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: widget.isLoading,
      child: Column(
        children: [
          PageViewOfCarDetails(
            pageController: pageController,
            onPageChanged: (pageNum) {
              currentPage = pageNum;
              setState(() {});
            },
            cars: widget.carsList,
          ),
          widget.carsList.isNotEmpty && widget.carsList.length > 1
              ? SizedBox(
                  height: 16.h,
                )
              : const SizedBox.shrink(),
          widget.carsList.isNotEmpty && widget.carsList.length > 1
              ? CustomDotsIndicator(
                  currentPage:
                      currentPage >= widget.carsList.length ? 0 : currentPage,
                  dotsCount:
                      widget.carsList.isEmpty ? 1 : widget.carsList.length,
                )
              : const SizedBox.shrink(),
           widget.carsList.isNotEmpty &&
                          widget
                                  .carsList[
                                      currentPage >= widget.carsList.length
                                          ? 0
                                          : currentPage]
                                  .nextChange ==
                              null ||
                      widget.carsList.isNotEmpty &&
                          widget
                                  .carsList[
                                      currentPage >= widget.carsList.length
                                          ? 0
                                          : currentPage]
                                  .nextChange !=
                              0
                  ?
          Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              OilChangeReminderContainer(
                      txt:
                          '${widget.carsList[currentPage >= widget.carsList.length ? 0 : currentPage].nextChange} ${S.of(context).Km}')
                
            ],
          ) : const SizedBox.shrink()
        ],
      ),
    );
  }
}
