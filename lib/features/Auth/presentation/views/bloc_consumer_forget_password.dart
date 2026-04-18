import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qodraapp/core/functions/error_bar_function.dart';
import 'package:qodraapp/core/functions/success_bar_function.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/send_otp_cubit/reset_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/send_otp_cubit/reset_states.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/forget_password_body.dart';
import 'package:qodraapp/generated/l10n.dart';

class BlocConsumerForgetPassword extends StatelessWidget {
  const BlocConsumerForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendOtpCubit, ResetStates>(
      listener: (context, state) {
        if (state is ResetFaluire) {
          if (state.errorMessage == 'No Internet Connection') {
            buildErrorBar(context, S.of(context).no_internet_retry);
          } else if (state.errorMessage == 'Email not registered') {
            buildErrorBar(context, S.of(context).phone_not_registered);
          } else {
            buildErrorBar(context, S.of(context).error_occurred_retry);
          }
        }
        if (state is ResetSucsess) {
          buildSuccessBar(context, S.of(context).otp_sent_success);
          Navigator.pushNamed(context, RoutesName.otpVerfication , arguments: state.phoneNum);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is ResetLoading,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.main,
            ),
            child: const ForgetPasswordBody());
      },
    );
  }
}
