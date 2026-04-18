// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/core/utlis/screen_size.dart';
import 'package:qodraapp/core/widgets/custom_text_button.dart';
import 'package:qodraapp/features/onboarding/presentation/views/widgets/arrow_icon.dart';
import 'package:qodraapp/core/widgets/custom_dots_indicator.dart';
import 'package:qodraapp/features/onboarding/presentation/views/widgets/custom_page_view.dart';
import 'package:qodraapp/features/onboarding/presentation/views/widgets/skip_text.dart';
import 'package:qodraapp/generated/l10n.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController pageController = PageController();

  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen =
        context.screenHeight < 600 || context.screenHeight < 350;
    double screenHeight = context.screenHeight;

    return SafeArea(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height:
                    isSmallScreen ? screenHeight * 0.45 : screenHeight * 0.55,
                child: CustomPageView(
                  pageController: pageController,
                  onPageChanged: (pageNum) {
                    setState(() {
                      currentPage = pageNum;
                    });
                  },
                ),
              ),
              CustomDotsIndicator(
                currentPage: currentPage,
                dotsCount: 3,
              ),
            ],
          ),
          Positioned(
            bottom: isSmallScreen ? screenHeight * 0.04 : screenHeight * 0.06,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomTextButton(
                  text: S.of(context).next,
                  onPressed: () {
                    _logicOfPageView();
                  }),
            ),
          ),
          Positioned(
              top: 16.h,
              right: 16.w,
              left: 16.w,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const ArrowIcon(),
                  SkipText(
                    onTap: (){
                      SharedPrefs.setBool(viewOnboarding, true);
                      Navigator.pushReplacementNamed(
                          context, RoutesName.welcomeScreen);
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }

  //___________________________________________________________

  void _logicOfPageView() {
    if (currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      SharedPrefs.setBool(viewOnboarding, true);
      Navigator.pushReplacementNamed(context, RoutesName.welcomeScreen);
    }
  }
}
