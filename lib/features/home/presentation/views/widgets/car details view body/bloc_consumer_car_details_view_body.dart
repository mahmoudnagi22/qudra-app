import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qodraapp/core/functions/error_bar_function.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/presentation/manager/car_service_info/car_service_info_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/car_service_info/car_service_info_states.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/car%20details%20view%20body/car_details_view_body.dart';
import 'package:qodraapp/generated/l10n.dart';

class BlocProviderOfCarViewBody extends StatefulWidget {
  const BlocProviderOfCarViewBody({super.key, required this.carsInfoEntity});
  final CarsInfoEntity carsInfoEntity;

  @override
  State<BlocProviderOfCarViewBody> createState() =>
      _BlocProviderOfCarViewBodyState();
}

class _BlocProviderOfCarViewBodyState extends State<BlocProviderOfCarViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LatestServicesCubitOfCar, LatesServicesInfoStateOfCar>(
      listener: (context, state) {
        if (state is LatesServicesSucsessOfCar) {
          if (state.sessionsList.isEmpty) {
            buildErrorBar(context, S.of(context).no_maintenance_records);
            return;
          }
          Navigator.pushNamed(context, RoutesName.servicesHistoryScreen,
              arguments: {
                'sessionsList': state.sessionsList,
              });
        } else if (state is LatesServicesErrorOfCar) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.main,
            ),
            inAsyncCall: state is LatesServicesLoadingOfCar,
            child: CarDetailsViewBody(carsInfoEntity: widget.carsInfoEntity));
      },
    );
  }
}
