import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/functions/error_bar_function.dart';
import 'package:qodraapp/core/functions/show_success_dialog.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/widgets/custom_app_bar.dart';
import 'package:qodraapp/core/widgets/custom_text_button.dart';
import 'package:qodraapp/core/widgets/custom_text_field.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/reset_password_cubit/resets_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/rules_password_container.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/sub_title_text.dart';
import 'package:qodraapp/generated/l10n.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key, required this.phoneNum});
  final String phoneNum ; 

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  late List<TextEditingController> textEditingControllerList;
  bool ch1 = false;
  bool ch2 = false;
  bool ch3 = false;
  bool ch4 = false;
  @override
  void initState() {
    super.initState();
    textEditingControllerList =
        List.generate(5, (_) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          CustomAppBar(
            txt: S.of(context).resetPassword,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 32.h),
          Image.asset(Assets.imagesResetPassword, height: 100.h, width: 100.w),
          SizedBox(height: 32.h),
          SubTitleText(txt: S.of(context).Password),
          SizedBox(
            height: 10.h,
          ),
          CustomTextField(
              onChanged: (value) {
                validatePasswordRules(value);
              },
              textEditingController: textEditingControllerList[0],
              txt: S.of(context).Password,
              prefixImage: Assets.imagesLockIcon,
              isPassword: true),
          SizedBox(height: 16.h),
          SubTitleText(txt: S.of(context).confirmPassword),
          SizedBox(
            height: 10.h,
          ),
          CustomTextField(
              textEditingController: textEditingControllerList[1],
              txt: S.of(context).confirmPassword,
              prefixImage: Assets.imagesLockIcon,
              isPassword: true),
          SizedBox(height: 32.h),
          RulesOfPasswordContainer(
            ch1: ch1,
            ch2: ch2,
            ch3: ch3,
            ch4: ch4,
          ),
          SizedBox(
            height: 32.h,
          ),
          CustomTextButton(
              text: S.of(context).changePassword,
              onPressed: () {
                if (textEditingControllerList[0].text !=
                    textEditingControllerList[1].text) {
                  buildErrorBar(context, S.of(context).passwordsDoNotMatch);
                } else {
                  BlocProvider.of<ResetPasswordCubit>(context).resetPassword(phone: widget.phoneNum, newPassword: textEditingControllerList[0].text);
                }
              })
        ],
      ),
    );
  }

  //------------------------------------------------
  void validatePasswordRules(String password) {
    setState(() {
      ch1 = password.length >= 8;
      ch2 = password.contains(RegExp(r'[A-Z]'));
      ch3 = password.contains(RegExp(r'\d'));
      ch4 = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
    });
    //-------------------------------------------------
  }

  void changePasswordWarning(BuildContext context) {
    showSuccessDialog(context, accept: () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        RoutesName.signInScreen,
        //مش كل مرة هيرجع للتسجيل لا - لو هو اصلا مسجل جوة يبقى هيرجع ل ال settings
        // تقريبا هنعمل بوب مرتين
        (route) => false,
      );
    }, txt: S.of(context).password_changed);
  }
}
