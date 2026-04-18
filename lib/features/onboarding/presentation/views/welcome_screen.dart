import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qodraapp/features/onboarding/presentation/views/widgets/welcome_screen_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: const Scaffold(
        body: WelcomeViewBody(),
      ),
    );
  }
}
