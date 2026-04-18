import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qodraapp/core/functions/error_bar_function.dart';
import 'package:qodraapp/core/functions/success_bar_function.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/send_otp_cubit/reset_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/send_otp_cubit/reset_states.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/verfiy_otp_cubit/verify_otp_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/verfiy_otp_cubit/verify_otp_states.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/otp_view_body.dart';
import 'package:qodraapp/generated/l10n.dart';

class BlocListenerOtpVerfication extends StatefulWidget {
  const BlocListenerOtpVerfication({
    super.key,
    required this.phoneNum,
  });

  final String phoneNum;

  @override
  State<BlocListenerOtpVerfication> createState() =>
      _BlocListenerOtpVerficationState();
}

class _BlocListenerOtpVerficationState
    extends State<BlocListenerOtpVerfication> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<VerifyOtpCubit, VerifyOtpStates>(
            listener: (context, state) {
              if (state is VerifyOtpSuccess) {
                isLoading = false;
                setState(() {});
                buildSuccessBar(context, S.of(context).otp_correct);
                Navigator.pushNamed(context, RoutesName.resetPasswordScreen , arguments: widget.phoneNum);
              } else if (state is VerifyOtpFaluire) {
                isLoading = false;
                setState(() {});
                if (state.errorMessage == 'No Internet Connection') {
                  buildErrorBar(context, S.of(context).no_internet_retry);
                } else if (state.errorMessage == 'Invalid OTP') {
                  buildErrorBar(context, S.of(context).invalid_otp);
                } else {
                  buildErrorBar(context, S.of(context).error_occurred_retry);
                }
              } else if (state is VerifyOtpLoading) {
                isLoading = true;
                setState(() {});
              }
            },
          ),
          BlocListener<SendOtpCubit, ResetStates>(
            listener: (context, state) {
              if (state is ResetSucsess) {
                isLoading = false;
                setState(() {});
                buildSuccessBar(context, S.of(context).otp_sent_success);
              } else if (state is ResetFaluire) {
                isLoading = false;
                setState(() {});
                if (state.errorMessage == 'No Internet Connection') {
                  buildErrorBar(context, S.of(context).no_internet_retry);
                } else if (state.errorMessage == 'Email not registered') {
                  buildErrorBar(context, S.of(context).phone_not_registered);
                } else {
                  buildErrorBar(context, S.of(context).error_occurred_retry);
                }
              } else if (state is ResetLoading) {
                isLoading = true;
                setState(() {});
              }
            },
          ),
        ],
        child: ModalProgressHUD(
            inAsyncCall: isLoading,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.main,
            ),
            child: OtpVerificationBody(
              phoneNum: widget.phoneNum,
            )));
  }
}
