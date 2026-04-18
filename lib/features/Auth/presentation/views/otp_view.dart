import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/services/service_locator.dart';
import 'package:qodraapp/features/Auth/data/repos/auth_repo_imp.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/verfiy_otp_cubit/verify_otp_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/views/bloc_listener_otp_verfication.dart';

import '../manager/cubits/send_otp_cubit/reset_cubit.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.phoneNum});
  final String phoneNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => SendOtpCubit(getIt<AuthRepoImp>()),
        ),
        BlocProvider(create: (context) => VerifyOtpCubit(getIt<AuthRepoImp>()))
      ], child: BlocListenerOtpVerfication(phoneNum: phoneNum)),
    );
  }
}

