import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocProvider;
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/core/widgets/custom_errors_widget.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';
import 'package:qodraapp/features/home/presentation/manager/workshop_info_cubit/workshop_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/workshop_info_cubit/workshop_states.dart';
import 'package:qodraapp/features/home/presentation/views/widgets/workshop%20container/workshop_container.dart';
import 'package:qodraapp/generated/l10n.dart';

class BlocProviderWorkShopInfo extends StatefulWidget {
  const BlocProviderWorkShopInfo({
    super.key,
  });

  @override
  State<BlocProviderWorkShopInfo> createState() =>
      _BlocProviderWorkShopInfoState();
}

class _BlocProviderWorkShopInfoState extends State<BlocProviderWorkShopInfo> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<WorkShopCubit, WorkShopInfoStates>(
        builder: (context, state) {
          bool isLoading = false;
          WorkShopEntity workShopEntity = WorkShopEntity(
            name: '',
            address: '',
          );
          if (state is WorkShopInfoLoadingState || state is WorkShopInfoInitailState) {
            isLoading = true;
          }
          if (state is WorkShopInfoErrorState) {
             if (state.message == 'No Internet Connection') {
              return CustomErrorsWidgets(
                txt1: S.of(context).no_internet,
                txt2: S.of(context).no_internet_retry,
                photo: Assets.imagesNoInternet,
                title: S.of(context).workshopDetails,
                onPressed: () {
                  onPressed();
                },
              );
            }
            return CustomErrorsWidgets(
              txt1: S.of(context).error_occurred,
              txt2: S.of(context).error_occurred_retry,
              photo: Assets.imagesError,
              onPressed: onPressed, title: S.of(context).workshopDetails,
            );
          }
          if (state is WorkShopInfoSucsessState) {
            if (state.workShopEntity.name != null) {
              workShopEntity = state.workShopEntity;
            } else {
              return CustomErrorsWidgets(

                txt1: S.of(context).no_data_found,
                txt2: S.of(context).try_again_later,
                photo: Assets.imagesNoDataError,
                onPressed: onPressed,
                title: S.of(context).workshopDetails
              );
            }
          }
          return WorkShopContainer(
            isLoading: isLoading,
            workShopEntity: workShopEntity,
          );
        },
      ),
    );
  }

  onPressed() async {
    String token = await SecurePrefs.getString(tokenSecureKey) ?? "";
    BlocProvider.of<WorkShopCubit>(context).getWorkShopInfo(token: token);
  }
}
