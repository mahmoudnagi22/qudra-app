import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/car%20details%20container/car_container.dart';

class PageViewOfCarDetails extends StatelessWidget {
  const PageViewOfCarDetails(
      {super.key,
      required this.pageController,
      this.onPageChanged,
      required this.cars});
  final PageController pageController;
  final Function(int)? onPageChanged;
  final List<CarsInfoEntity> cars;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor;
    return SizedBox(
      height: (textScale > 1.2 ? 230.h : 185.h),
      child: PageView.builder(
          reverse: true,
          onPageChanged: onPageChanged,
          controller: pageController,
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: cars.isEmpty ? 1 : cars.length,
          itemBuilder: (context, index) {
            return CarContainer(
              carsInfoEntity: cars.isEmpty
                  ? CarsInfoEntity(
                      id: 1,
                      make: '',
                      carModel: '',
                      plateNumber: '',
                      oilType: '',
                      year: 0,
                      nextChange: 1,
                      lastChange: '',
                      currentKm: 0)
                  : cars[index],
            );
          }),
    );
  }
}
