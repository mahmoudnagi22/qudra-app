import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/home/presentation/manager/car_info_cubit.dart/car_info_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/latest_services_cubit.dart/latest_services_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/userInfoCubit/userInfoCubit.dart';
import 'package:qodraapp/features/home/presentation/manager/workshop_info_cubit/workshop_cubit.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/bloc_builder_app_bar.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/bloc_builder_cars_info.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/latest%20services%20container/bloc_builder_latest_services.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/rank%20container/bloc_builder_rank_container.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/workshop%20view%20body/bloc_provider_workshop_info.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchCarsData();
    fetchLatestServicesData();
    fetchWorkShopData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: AppColors.main,
        backgroundColor: AppColors.white,
        onRefresh: onRefresh,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const BlocBuilderCustomAppBar(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            const BlocProviderWorkShopInfo(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            const BlocBuilderCarsInfo(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            const SliverToBoxAdapter(
              child: BlocBuilderLatestServices(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            const SliverToBoxAdapter(
              child: BlocBuilderRankContainer(
           ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  fetchUserData({bool? isRefresh}) async {
    String id = await SecurePrefs.getString(userIdSecureKey) ?? "";
    if (id.isNotEmpty) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<UserInfoCubit>(context).fetchUserInfo(id: id , isRefresh: isRefresh);
    }
  }

  fetchCarsData({bool? isRefresh}) async {
    String id = await SecurePrefs.getString(userIdSecureKey) ?? "";
    String token = await SecurePrefs.getString(tokenSecureKey) ?? "";
    if (id.isNotEmpty && token.isNotEmpty) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<CarInfoCubit>(context)
          .getCarsInfo(token: token, id: id, isRefresh: isRefresh);
    }
  }

  fetchLatestServicesData({bool? isRefresh}) async {
    String id = await SecurePrefs.getString(userIdSecureKey) ?? "";
    String token = await SecurePrefs.getString(tokenSecureKey) ?? "";

    if (id.isNotEmpty && token.isNotEmpty) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<LatestServicesCubit>(context)
          .getLatestServicesInfo(userId: id, isRefresh: isRefresh);
    }
  }

  fetchWorkShopData({bool? isRefresh}) async {
    String token = await SecurePrefs.getString(tokenSecureKey) ?? "";
    if (token.isNotEmpty) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<WorkShopCubit>(context).getWorkShopInfo(token: token , isRefresh: isRefresh);
    }
  }

  Future<void> onRefresh() async {
    await fetchUserData(isRefresh: true);
    await fetchCarsData(isRefresh: true);
    await fetchLatestServicesData(isRefresh: true);
    await fetchWorkShopData(isRefresh: true);
  }
}

