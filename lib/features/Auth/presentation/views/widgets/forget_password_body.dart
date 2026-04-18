import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/widgets/custom_app_bar.dart';
import 'package:qodraapp/core/widgets/custom_text_button.dart';
import 'package:qodraapp/core/widgets/custom_text_field.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/send_otp_cubit/reset_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/sub_title_text.dart';
import 'package:qodraapp/generated/l10n.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            txt: S.of(context).resetPassword,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 32.h,
          ),
          SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset(Assets.imagesResetPassword)),
          SizedBox(
            height: 32.h,
          ),
          SubTitleText(txt: S.of(context).enterPhoneToSendCode),
          SizedBox(
            height: 10.h,
          ),
          CustomTextField(
              textEditingController: textEditingController,
              txt: S.of(context).phoneNumber,
              prefixImage: Assets.imagesDeviceIcon,
              isPassword: false),
          SizedBox(
            height: 40.h,
          ),
          CustomTextButton(
              text: S.of(context).sendCode,
              onPressed: () {
                BlocProvider.of<SendOtpCubit>(context).sendOtp(phoneNum: textEditingController.text);
               // Navigator.pushNamed(context, RoutesName.otpVerfication);
              })
        ],
      ),
    );
  }
}
