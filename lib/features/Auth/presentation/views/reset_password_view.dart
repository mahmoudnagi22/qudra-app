import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qodraapp/core/functions/error_bar_function.dart';
import 'package:qodraapp/core/functions/success_bar_function.dart';
import 'package:qodraapp/core/services/service_locator.dart';
import 'package:qodraapp/features/Auth/data/repos/auth_repo_imp.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/reset_password_cubit/reset_states.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/reset_password_cubit/resets_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/reset_password_view_body.dart';
import 'package:qodraapp/generated/l10n.dart';

import '../../../../core/utlis/app_colors.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.phoneNum});
  final String phoneNum ; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: BlocProvider(
          create: (context) => ResetPasswordCubit(
            getIt<AuthRepoImp>()
          ),
          child:  BlocConsumerResetPassword(phoneNum: phoneNum,),
        ),
      ),
    );
  }
}

class BlocConsumerResetPassword extends StatelessWidget {
  const BlocConsumerResetPassword({
    super.key, required this.phoneNum,
  });
  final String phoneNum ; 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
      listener: (context, state) {
        if(state is ResetPasswordFaluire){
          if(state.errorMessage == 'No Internet Connection'){
             buildErrorBar(context, S.of(context).no_internet_retry);
          }
          else {
               buildErrorBar(context, S.of(context).error_occurred_retry);
          }
        }
        else if (state is ResetPasswordSuccess){
          buildSuccessBar(context, S.of(context).password_changed_reset);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ResetPasswordLoading,
          progressIndicator: const CircularProgressIndicator(
              color: AppColors.main,
            ),
          child:  ResetPasswordViewBody(phoneNum:phoneNum));
      },
    );
  }
}
