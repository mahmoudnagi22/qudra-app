import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/core/widgets/custom_app_bar.dart';
import 'package:qodraapp/core/widgets/custom_text_button.dart';
import 'package:qodraapp/core/widgets/custom_text_field.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/sub_title_text.dart';
import 'package:qodraapp/features/Auth/presentation/views/widgets/text_span_log_in.dart';
import 'package:qodraapp/generated/l10n.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController textEditingControllerPhoneNum =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: globalKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomAppBar(
              txt: S.of(context).AppBarLogin,
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
                child: Image.asset(Assets.imagesLogoImage)),
            SizedBox(
              height: 32.h,
            ),
            SubTitleText(txt: S.of(context).phoneNumber),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(
              textEditingController: textEditingControllerPhoneNum,
              isPassword: false,
              txt: S.of(context).phoneNumber,
              prefixImage: Assets.imagesDeviceIcon,
              textInputType: TextInputType.phone,
            ),
            SizedBox(
              height: 16.h,
            ),
            SubTitleText(txt: S.of(context).Password),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(
              textEditingController: textEditingControllerPassword,
              isPassword: true,
              txt: S.of(context).Password,
              prefixImage: Assets.imagesLockIcon,
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: 5.h,
            ),
            Align(
                alignment: AlignmentDirectional.topEnd,
                child: Padding(
                  padding: edgeInsets,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.forgotPasswordScreen);
                    },
                    child: Text(
                      S.of(context).forgetPassword,
                      style: AppTextStyles.text12Regular,
                    ),
                  ),
                )),
            SizedBox(
              height: 32.h,
            ),
            CustomTextButton(
                text: S.of(context).loginButton,
                onPressed: () async{
                  String fcmToken = await SecurePrefs.getString(fcmTokenKey) ?? "";
                  String deviceId = await SecurePrefs.getString(deviceIdKey) ?? "";
                  if (globalKey.currentState!.validate()) {
                    globalKey.currentState!.save();
                    BlocProvider.of<AuthCubit>(context).signIn(
                        phoneNum: textEditingControllerPhoneNum.text,
                        password: textEditingControllerPassword.text ,
                        fcmToken: fcmToken, deviceId: deviceId,
                        );
                    SharedPrefs.setBool(selectedLang, true);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                }),
            SizedBox(
              height: 10.h,
            ),
            const TextSpanLogIn()
          ],
        ),
      ),
    );
  }
}
