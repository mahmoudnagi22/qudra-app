import 'package:flutter/material.dart';
import 'package:qodraapp/features/onboarding/presentation/views/widgets/onBoarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}
