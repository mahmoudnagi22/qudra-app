import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/core/widgets/custom_errors_widget.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/presentation/manager/latest_services_cubit.dart/latest_services_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/latest_services_cubit.dart/latest_servises_states.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/latest%20services%20container/latest_service_container.dart';
import 'package:qodraapp/generated/l10n.dart';

class BlocBuilderLatestServices extends StatefulWidget {
  const BlocBuilderLatestServices({super.key});

  @override
  State<BlocBuilderLatestServices> createState() =>
      _BlocBuilderLatestServicesState();
}

class _BlocBuilderLatestServicesState extends State<BlocBuilderLatestServices> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestServicesCubit, LatesServicesInfoState>(
      builder: (context, state) {
        bool isLoading = false;
        List<ServiceEntity> sessionsList = [];
        if (state is LatesServicesLoading || state is LatesServicesInitial) {
          isLoading = true;
        } else if (state is LatesServicesError) {
          if (state.message == 'No Internet Connection') {
            return CustomErrorsWidgets(
              txt1: S.of(context).no_internet,
              txt2: S.of(context).no_internet_retry,
              photo: Assets.imagesNoInternet,
              onPressed: onPressed, title:  S.of(context).LatestServices
            );
            
          }
          else {
           return CustomErrorsWidgets(
            txt1: S.of(context).error_occurred, txt2: S.of(context).error_occurred_retry, photo: Assets.imagesError , 
            onPressed: onPressed, title: S.of(context).LatestServices,
            );
          }
        } else if (state is LatesServicesSucsess) {
          sessionsList = state.sessionsList;
          if (sessionsList.isEmpty) {
            return CustomErrorsWidgets(
              txt1: S.of(context).no_data_found,
              txt2: S.of(context).try_again_later,
              photo: Assets.imagesNoDataError,
              onPressed: onPressed, title:  S.of(context).LatestServices,
            );
          }
        }
        return LatestServices(isLoading: isLoading, sessionsList: sessionsList);
      },
    );
  }

  onPressed() async {
    String id = await SecurePrefs.getString(userIdSecureKey) ?? "";
    BlocProvider.of<LatestServicesCubit>(context)
        .getLatestServicesInfo(userId: id);
  }
}

