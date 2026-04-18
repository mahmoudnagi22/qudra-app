import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/services/service_locator.dart';
import 'package:qodraapp/features/home/data/repos/HomeRepoImp.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/presentation/manager/latest_services_cubit.dart/latest_services_cubit.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/service%20history%20view%20body/service_history_view_body.dart';

class ServiceHistoryView extends StatelessWidget {
  const ServiceHistoryView(
      {super.key, required this.sessionsList, });
  final List<ServiceEntity> sessionsList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LatestServicesCubit(getIt<HomeRepoImp>()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: ServiceHistoryViewBody(
              sessionsList: sessionsList, 
            ),
          );
        },
      ),
    );
  }
}
