import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/features/onboarding/domain/entities/on_boarding_entity.dart';
import 'package:qodraapp/features/onboarding/presentation/views/widgets/page_view_item.dart';
import 'package:qodraapp/generated/l10n.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });
  final PageController pageController;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      reverse: Directionality.of(context) == TextDirection.rtl,
      children: [
        PageViewItem(
            onBoardingEntity: OnBoardingEntity(
                img: Assets.imagesOnboardingImageOne,
                title: S.of(context).onboarding_title_1,
                subtitle: S.of(context).onboarding_subtitle_1)),
        PageViewItem(
            onBoardingEntity: OnBoardingEntity(
                img: Assets.imagesOnboardingImageTwo,
                title: S.of(context).onboarding_title_2,
                subtitle: S.of(context).onboarding_subtitle_2)),
        PageViewItem(
            onBoardingEntity: OnBoardingEntity(
                img: Assets.imagesOnboardingImageThree,
                title: S.of(context).onboarding_title_3,
                subtitle: S.of(context).onboarding_subtitle_3)),
      ],
    );
  }
}
