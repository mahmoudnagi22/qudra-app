import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/functions/style_text_field.dart';
import 'package:qodraapp/generated/l10n.dart';

class CustomTextFieldTransfer extends StatefulWidget {
  const CustomTextFieldTransfer({
    super.key,
    required this.txt,
    this.textEditingController,
    this.onChanged,
    this.edgeInsets,
    required this.maxLines,
    this.keyboardType,
    this.validator,
  });
  final String txt;
  final TextEditingController? textEditingController;
  final void Function(String)? onChanged;
  final EdgeInsets? edgeInsets;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  @override
  State<CustomTextFieldTransfer> createState() =>
      _CustomTextFieldTransferState();
}

class _CustomTextFieldTransferState extends State<CustomTextFieldTransfer> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: TextFormField(
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        controller: widget.textEditingController,
        validator: widget.validator ??
            (value) {
              if (value == null || value.trim().isEmpty == true) {
                return S.of(context).requiredField;
              }
              return null;
            },
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: widget.edgeInsets ?? EdgeInsets.all(8.r),
          hintText: widget.txt,
          suffixIconConstraints: BoxConstraints(
            maxHeight: 40.h,
            maxWidth: 40.w,
          ),

          hintStyle: AppTextStyles.text14Regular,
          enabledBorder: styleTextField(),
          focusedBorder: styleTextField(),
          disabledBorder: styleTextField(),
          errorBorder: styleTextFieldError(),
          focusedErrorBorder: styleTextFieldError(),
          errorStyle: AppTextStyles.text12Regular,

          //
        ),
      ),
    );
  }
}
