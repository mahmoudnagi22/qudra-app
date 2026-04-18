import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/core/widgets/custom_errors_widget.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/presentation/manager/car_info_cubit.dart/car_info_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/car_info_cubit.dart/car_info_states.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/cars_data.dart';
import 'package:qodraapp/generated/l10n.dart';

class BlocBuilderCarsInfo extends StatefulWidget {
  const BlocBuilderCarsInfo({super.key});

  @override
  State<BlocBuilderCarsInfo> createState() => _BlocBuilderCarsInfoState();
}

class _BlocBuilderCarsInfoState extends State<BlocBuilderCarsInfo> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<CarInfoCubit, CarInfoState>(
        builder: (context, state) {
          List<CarsInfoEntity> carsList = [];
          bool isLoading = false;
          if (state is CarInfoSucsess) {
            carsList = state.cars;
            if (state.cars.isEmpty) {
              return CustomErrorsWidgets(
                title: S.of(context).cars,
                txt1: S.of(context).no_data_found,
                txt2: S.of(context).try_again_later,
                photo: Assets.imagesNoDataError,
                onPressed: onPressed,
              );
            }
          } else if (state is CarInfoError) {
            if (state.message == 'No Internet Connection') {
              return CustomErrorsWidgets(
                title: S.of(context).cars,
                txt1: S.of(context).no_internet,
                txt2: S.of(context).no_internet_retry,
                photo: Assets.imagesNoInternet,
                onPressed: () {
                  onPressed();
                },
              );
            }
            return CustomErrorsWidgets(
              txt1: S.of(context).error_occurred,
              txt2: S.of(context).error_occurred_retry,
              photo: Assets.imagesError,
              onPressed: onPressed, title: S.of(context).cars,
            );
          } else if (state is CarInfoLoading || state is CarInfoInitial) {
            isLoading = true;
          }
          return CarsData(carsList: carsList, isLoading: isLoading);
        },
      ),
    );
  }

  onPressed() async {
    String id = await SecurePrefs.getString(userIdSecureKey) ?? "";
    String token = await SecurePrefs.getString(tokenSecureKey) ?? "";
    BlocProvider.of<CarInfoCubit>(context).getCarsInfo(token: token, id: id);
  }
}
