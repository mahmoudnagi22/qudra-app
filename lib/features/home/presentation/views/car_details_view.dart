import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/services/service_locator.dart';
import 'package:qodraapp/features/home/data/repos/HomeRepoImp.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/presentation/manager/car_service_info/car_service_info_cubit.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/car%20details%20view%20body/bloc_consumer_car_details_view_body.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key, required this.carsInfoEntity});
  final CarsInfoEntity carsInfoEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LatestServicesCubitOfCar(getIt<HomeRepoImp>()),
      child: Scaffold(
        body: BlocProviderOfCarViewBody(
          carsInfoEntity: carsInfoEntity,
        ),
      ),
    );
  }
}
