import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qodraapp/core/functions/error_bar_function.dart';
import 'package:qodraapp/core/functions/show_success_dialog.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/home/presentation/manager/car_info_cubit.dart/car_info_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/latest_services_cubit.dart/latest_services_cubit.dart';
import 'package:qodraapp/features/home/presentation/manager/userInfoCubit/userInfoCubit.dart';
import 'package:qodraapp/features/home/presentation/manager/workshop_info_cubit/workshop_cubit.dart';
import 'package:qodraapp/features/settings/presentation/manager/transfer%20workshop%20cubit/transfer_cubit.dart';
import 'package:qodraapp/features/settings/presentation/manager/transfer%20workshop%20cubit/transfer_states.dart';
import 'package:qodraapp/features/settings/presentation/views/widgets/workshop_transfer/workshop_transfer_body.dart';
import 'package:qodraapp/generated/l10n.dart';

class BlocConsumerTransferWorkshop extends StatelessWidget {
  const BlocConsumerTransferWorkshop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferCubit, TransferState>(
      listener: (context, state) {
        if (state is TransferSuccess) {
          showSuccessDialog(context, accept: () {
            Navigator.pop(context);
            Navigator.pop(context);
            updateData(context);
          }, txt: S.of(context).transferAcceptedTxt);
        } else if (state is TransferFailure) {
          if (state.errorMessage == "workshop not found") {
            buildErrorBar(context, S.of(context).invalidWorkshopTxt);
          } else if (state.errorMessage.trim().isEmpty) {
            buildErrorBar(context, S.of(context).genericServerError);
          } else {
            buildErrorBar(context, state.errorMessage);
          }
        } else if (state is TransferLoading) {
          FocusScope.of(context).unfocus();
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.main,
            ),
            dismissible: false,
            inAsyncCall: state is TransferLoading,
            child: const WorkShopTransferViewBody());
      },
    );
  }
//---------------------------------------------------------------

  void updateData(BuildContext context) async {
    String? id = await SecurePrefs.getString(userIdSecureKey);
    String? token = await SecurePrefs.getString(tokenSecureKey);
    if (id != null && token != null) {
      await BlocProvider.of<UserInfoCubit>(context).fetchUserInfo(id: id);
      await BlocProvider.of<WorkShopCubit>(context)
          .getWorkShopInfo(token: token);
      await BlocProvider.of<CarInfoCubit>(context)
          .getCarsInfo(token: token, id: id);
      await BlocProvider.of<LatestServicesCubit>(context)
          .getLatestServicesInfo(userId: id);
    }
  }
}
