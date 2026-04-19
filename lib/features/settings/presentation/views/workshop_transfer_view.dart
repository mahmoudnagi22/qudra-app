import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/services/service_locator.dart';
import 'package:qodraapp/features/home/data/repos/HomeRepoImp.dart';
import 'package:qodraapp/features/home/presentation/manager/car_info_cubit.dart/car_info_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/latest_services_cubit.dart/latest_services_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/userInfoCubit/userInfoCubit.dart';
import 'package:qodraapp/features/home/presentation/manager/workshop_info_cubit/workshop_cubit.dart';
import 'package:qodraapp/features/settings/data/repos/settings_repo_imp.dart';
import 'package:qodraapp/features/settings/presentation/manager/transfer%20workshop%20cubit/transfer_cubit.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/workshop_transfer/bloc_consumer_transfer_workshop.dart';

class WorkShopTransferView extends StatelessWidget {
  const WorkShopTransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => TransferCubit(getIt<SettingsRepoImp>())),
          BlocProvider(
              create: (context) => UserInfoCubit(getIt<HomeRepoImp>())),
          BlocProvider(
              create: (context) => WorkShopCubit(getIt<HomeRepoImp>())),
          BlocProvider(create: (context) => CarInfoCubit(getIt<HomeRepoImp>())),
          BlocProvider(
              create: (context) => LatestServicesCubit(getIt<HomeRepoImp>())),
        ],
        child: const Scaffold(
          body: BlocConsumerTransferWorkshop(),

        ),
      ),
    );
  }
}
