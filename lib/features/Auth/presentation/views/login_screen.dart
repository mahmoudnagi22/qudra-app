import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/services/service_locator.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/Auth/data/repos/auth_repo_imp.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/login_screen_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepoImp>()) ,
      child: WillPopScope(
        onWillPop: () async {
          bool isSelectedLag = SharedPrefs.getBool(selectedLang);
          if (isSelectedLag == false) {
            Navigator.pop(context);
            return true;
          } else {
            SystemNavigator.pop();
            return false;
          }
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: const Scaffold(
            body: LoginViewBody(),
          ),
        ),
      ),
    );
  }
}
