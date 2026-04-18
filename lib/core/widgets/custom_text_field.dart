import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/core/functions/style_text_field.dart';
import 'package:qodraapp/generated/l10n.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.txt,
    required this.prefixImage,
    required this.isPassword,
    this.textInputType,
    this.textEditingController,
    this.onChanged,
  });
  final String txt;
  final String prefixImage;
  final bool isPassword;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final void Function(String)? onChanged;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: TextFormField(
        controller: widget.textEditingController,
        keyboardType: widget.textInputType,
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value == null || value.isEmpty == true) {
            return S.of(context).requiredField;
          }
        },
        onChanged: widget.onChanged,
        obscureText: widget.isPassword ? isObscured : false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8.r),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 40.h,
              maxWidth: 40.w,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(widget.prefixImage),
            ),
            hintText: widget.txt,
            suffixIconConstraints: BoxConstraints(
              maxHeight: 40.h,
              maxWidth: 40.w,
            ),
            suffixIcon: widget.isPassword
                ? isObscured == true
                    ? GestureDetector(
                        onTap: () {
                          isObscured = !isObscured;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: SvgPicture.asset(Assets.imagesEyeIcon),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscured = !isObscured;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: Image.asset(Assets.imagesEyeIconDisabled),
                        ),
                      )
                : null,
            hintStyle: AppTextStyles.text14Regular,
            enabledBorder: styleTextField(),
            focusedBorder: styleTextField(),
            disabledBorder: styleTextField(),
            errorBorder: styleTextFieldError(),
            focusedErrorBorder: styleTextFieldError(),
            errorStyle: AppTextStyles.text12Regular),
      ),
    );
  }
}
