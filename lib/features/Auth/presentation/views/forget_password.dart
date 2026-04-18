import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/services/service_locator.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/features/Auth/data/repos/auth_repo_imp.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/send_otp_cubit/reset_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/views/bloc_consumer_forget_password.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendOtpCubit(getIt<AuthRepoImp>()),
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.signInScreen, (routes) => false);
          return false;
        },
        child: const Scaffold(
          body: BlocConsumerForgetPassword(),
        ),
      ),
    );
  }
}
