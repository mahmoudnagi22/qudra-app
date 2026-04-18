import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/functions/style_text_field.dart';

class CustomChatTextField extends StatefulWidget {
  const CustomChatTextField({
    super.key,
    required this.txt,
    this.textEditingController,
    this.onChanged,
  });
  final String txt;
  final TextEditingController? textEditingController;
  final void Function(String)? onChanged;
  @override
  State<CustomChatTextField> createState() => _CustomChatTextFieldState();
}

class _CustomChatTextFieldState extends State<CustomChatTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      onChanged: widget.onChanged,
       minLines: 1, 
       maxLines: 5,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8.r),
          hintText: widget.txt,
          hintStyle: AppTextStyles.text14Regular,
          enabledBorder: styleTextField(),
          focusedBorder: styleTextField(),
          disabledBorder: styleTextField(),
          errorBorder: styleTextField(),
          focusedErrorBorder: styleTextField(),
          errorStyle: AppTextStyles.text12Regular),
    );
  }
}
