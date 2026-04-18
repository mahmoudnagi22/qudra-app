import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/functions/error_bar_function.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/widgets/custom_app_bar.dart';
import 'package:qodraapp/core/widgets/custom_text_button.dart';
import 'package:qodraapp/features/Auth/presentation/helpers/clear_code_function.dart';
import 'package:qodraapp/features/Auth/presentation/helpers/code_calc_function.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/send_otp_cubit/reset_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/verfiy_otp_cubit/verify_otp_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/otp_row_codes.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/resend_code_text.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/sub_title_text.dart';
import 'package:qodraapp/generated/l10n.dart';

class OtpVerificationBody extends StatefulWidget {
  const OtpVerificationBody({super.key, required this.phoneNum});
  final String phoneNum ; 

  @override
  State<OtpVerificationBody> createState() => _OtpVerificationBodyState();
}

class _OtpVerificationBodyState extends State<OtpVerificationBody> {
  late final List<TextEditingController> textEditingControllerList;
  int seconds = 40;
  Timer? timer;
  //----------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    startTimer();
    textEditingControllerList =
        List.generate(6, (_) => TextEditingController());
  }
  //----------------------------------------------------------------

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
        SizedBox(height: 32.h),
        Image.asset(Assets.imagesResetPassword, height: 100.h, width: 100.w),
        SizedBox(height: 32.h),
        SubTitleText(txt: S.of(context).enterVerificationCode),
        SizedBox(height: 16.h),
        OtpRowCodes(textEditingControllerList: textEditingControllerList),
        SizedBox(
          height: 16.h,
        ),
        ResendCodeText(seconds: seconds),
        SizedBox(height: 32.h),
        CustomTextButton(
            text: S.of(context).reenterCode,
            onPressed: () {
              if (seconds != 0) {
                buildErrorBar(context, S.of(context).waitUntilTimerEnds);
              } else {
                BlocProvider.of<SendOtpCubit>(context).sendOtp(phoneNum: widget.phoneNum);
                clearData(textEditingControllerList);
                startTimer();
              }
            }),
        const SizedBox(
          height: 16,
        ),
        CustomTextButton(
          text: S.of(context).confirm,
          onPressed: () {
            String code = codeCalc(textEditingControllerList);
            debugPrint(code);
            BlocProvider.of<VerifyOtpCubit>(context).verfiyOtp(phone: widget.phoneNum, otp: code);
          },
          isOutlined: true,
        )
      ],
    ));
  }

  //--------------------------------------------------------------
  startTimer() {
    timer?.cancel();
    setState(() {
      seconds = 40;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    for (final controller in textEditingControllerList) {
      controller.dispose();
    }
    timer?.cancel();
    super.dispose();
  }
}
