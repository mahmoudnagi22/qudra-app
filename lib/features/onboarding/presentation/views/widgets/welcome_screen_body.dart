import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qodraapp/core/cubits/localization_cubit/localization_cubit.dart';
import 'package:qodraapp/core/cubits/localization_cubit/localization_cubit_states.dart';
import 'package:qodraapp/core/functions/error_bar_function.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/core/utlis/screen_size.dart';
import 'package:qodraapp/core/widgets/custom_text_button.dart';
import 'package:qodraapp/generated/l10n.dart';

class WelcomeViewBody extends StatefulWidget {
  const WelcomeViewBody({super.key});

  @override
  State<WelcomeViewBody> createState() => _WelcomeViewBodyState();
}

class _WelcomeViewBodyState extends State<WelcomeViewBody> {
  bool? isArabic;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LocalizationCubit, LocalizationType>(
      listener: (context, state) {
        if (state is LoadedLocalization) {
          setState(() {
            isLoading = false;
          });
        } else if (state is LoadingLocalization) {
          setState(() {
            isLoading = true;
          });
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        color: AppColors.black,
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Image.asset(Assets.imagesLogoImage)),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  S.of(context).welcome,
                  style: AppTextStyles.text22Medium,
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: context.screenWidth * 0.9,
                  child: Text(
                    S.of(context).welcome_subtitle,
                    style: AppTextStyles.text18Regular.copyWith(height: 1.3.h),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 64.h,
                ),
                Text(
                  S.of(context).choose_language,
                  style: AppTextStyles.text16Medium,
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                    width: context.screenWidth * 0.9,
                    child: CustomTextButton(
                      text: S.of(context).language_ar,
                      onPressed: () {
                        setState(() {
                          isArabic = true;
                        });
                      },
                      isOutlined: true,
                      width: isArabic != null && isArabic == true ? 3 : 1,
                    )),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                    width: context.screenWidth * 0.9,
                    child: CustomTextButton(
                      text: S.of(context).language_en,
                      onPressed: () {
                        isArabic = false;
                        setState(() {});
                      },
                      isOutlined: true,
                      width: isArabic != null && isArabic == false ? 3 : 1,
                    )),
                SizedBox(
                  height: 32.h,
                ),
                CustomTextButton(
                    text: S.of(context).continue_button,
                    onPressed: () {
                      if (isArabic == null) {
                        buildErrorBar(context, S.of(context).errorlangselect);
                        return;
                      }
                      String langType = isArabic == true ? 'ar' : 'en';
                      SharedPrefs.setString(selectedLanguageType, langType);
                      BlocProvider.of<LocalizationCubit>(context)
                          .changeLan(Locale(langType));
                      Navigator.pushNamed(context, RoutesName.signInScreen);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
