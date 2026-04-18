import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/splash_screen/presentation/helpers/splash_animation.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/generated/l10n.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late final AnimationController logoController;
  late final Animation<Offset> logoAnimation;
  late final AnimationController textController;
  late final Animation<Offset> textAnimation;
  late final AnimationController textOpacityController;
  late final Animation<double> textOpacity;
  @override
  void initState() {
    super.initState();
    _initAnimations();
    _startAnimations();
    _navigate();
  }

  @override
  void dispose() {
    logoController.dispose();
    textController.dispose();
    textOpacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: logoAnimation,
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: Center(
                    child: Image.asset(
                  Assets.imagesLogoImage,
                  fit: BoxFit.contain,
                )),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            FadeTransition(
              opacity: textOpacity,
              child: SlideTransition(
                position: textAnimation,
                child: Text(
                  S.of(context).brandName,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.text24Medium,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  //functions
  _initAnimations() {
    logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    logoAnimation =
        createSlideAnimation(logoController, const Offset(1, 0), Offset.zero);
    textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    textAnimation =
        createSlideAnimation(textController, const Offset(-1, 0), Offset.zero);
    textOpacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    textOpacity = createFadeAnimation(controller: textOpacityController);
  }

  _startAnimations() async {
    await logoController.forward();
    textController.forward();
    textOpacityController.forward();
  }

  _navigate() async {
    await Future.delayed(const Duration(seconds: 5), () {
      bool isLoggedIn = SharedPrefs.getBool(isLoggedInKey);
      bool viewedOnboarding = SharedPrefs.getBool(viewOnboarding);
      bool iSselectedLang = SharedPrefs.getBool(selectedLang);
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
        return;
      } else if (viewedOnboarding && iSselectedLang == true) {
        Navigator.pushReplacementNamed(context, RoutesName.signInScreen);
        return;
      } else if (viewedOnboarding && iSselectedLang == false) {
        Navigator.pushReplacementNamed(context, RoutesName.welcomeScreen);
        return;
      }
      Navigator.pushReplacementNamed(context, RoutesName.onboardingScreen);
    });
  }
}
