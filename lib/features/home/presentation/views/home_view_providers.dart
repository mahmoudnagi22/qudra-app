import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/services/service_locator.dart';
import 'package:qodraapp/features/home/data/repos/HomeRepoImp.dart';
import 'package:qodraapp/features/home/presentation/manager/car_info_cubit.dart/car_info_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/car_service_info/car_service_info_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/latest_services_cubit.dart/latest_services_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/userInfoCubit/userInfoCubit.dart';
import 'package:qodraapp/features/home/presentation/manager/workshop_info_cubit/workshop_cubit.dart';
import 'package:qodraapp/features/home/presentation/views/home_view_ui.dart';
import 'package:qodraapp/features/notifications/data/repos/notifications_repo_imp.dart';
import 'package:qodraapp/features/notifications/presentation/manager/notification_cubit.dart/notification_cubit.dart';

class HomeViewProviders extends StatefulWidget {
  const HomeViewProviders({super.key});

  @override
  State<HomeViewProviders> createState() => _HomeViewProvidersState();
}

class _HomeViewProvidersState extends State<HomeViewProviders> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserInfoCubit>(
          create: (context) => UserInfoCubit(getIt<HomeRepoImp>()),
        ),
        BlocProvider<CarInfoCubit>(
          create: (context) => CarInfoCubit(getIt<HomeRepoImp>()),
        ),
        BlocProvider(
            create: (context) => LatestServicesCubit(getIt<HomeRepoImp>())),
        BlocProvider(create: (context) => WorkShopCubit(getIt<HomeRepoImp>())),
        BlocProvider(
            create: (context) =>
                LatestServicesCubitOfCar(getIt<HomeRepoImp>())),
        BlocProvider(
            create: (context) =>
                NotificationCubit(getIt<NotificationsRepoImp>())),
      ],

      // ignore: deprecated_member_use
      child: const HomeViewUi(),
    );
  }
}
