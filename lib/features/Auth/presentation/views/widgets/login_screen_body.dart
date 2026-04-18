import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qodraapp/core/functions/error_bar_function.dart';
import 'package:qodraapp/core/functions/success_bar_function.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/auth_cubit/auth_sates.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/login_form.dart';
import 'package:qodraapp/generated/l10n.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isLoading = false;
  String getErrorMessage(String errorMessage, BuildContext context) {
    switch (errorMessage) {
      case 'phone or number':
        return S.of(context).wrong_credentials;
      case 'user not found':
        return S.of(context).user_not_found;
      default:
        return errorMessage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is AuthFaluire) {
          isLoading = false;
          if (state.errorMessage == 'No Internet Connection') {
            buildErrorBar(context, S.of(context).no_internet_retry);
          }
        final String msg = getErrorMessage(state.errorMessage, context);
         buildErrorBar(context, msg);
        } else {
          isLoading = false;
          buildSuccessBar(context, S.of(context).login_success);
          Navigator.pushNamed(context, RoutesName.homeScreen);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
              progressIndicator: const CircularProgressIndicator(
              color: AppColors.main,
            ),
          child: const SingleChildScrollView(child: LoginForm()),
        );
      },
    );
  }
}
