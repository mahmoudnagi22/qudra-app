import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_text_styles.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/chatbot/domain/entities/messageEntity.dart';

class CustomBubble extends StatefulWidget {
  const CustomBubble({
    super.key,
    required this.isArabic,
    required this.message,
    required this.isUser,
    this.messageEntity,
  });

  final bool isArabic;
  final String message;
  final bool isUser;
  final MessageEntity? messageEntity;

  @override
  State<CustomBubble> createState() => _CustomBubbleState();
}

class _CustomBubbleState extends State<CustomBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: boxDecoration.copyWith(
          color: widget.isUser ? AppColors.yellow : AppColors.mainLighter,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              offset: const Offset(0, 5),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
          borderRadius: _getBorderRadius(),
        ),
        child: widget.isUser
    ? Text(
        widget.message,
        style: AppTextStyles.text16Regular.copyWith(height: 1.5.h),
      )
    : (widget.messageEntity != null && widget.messageEntity!.isFullyTyped == false
        ? AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText(
                widget.message,
                speed: const Duration(milliseconds: 30),
                textStyle: AppTextStyles.text16Regular.copyWith(height: 1.5.h),
                cursor: '',
              ),
            ],
            onFinished: () {
              setState(() {
                widget.messageEntity!.isFullyTyped = true;
              });
            },
          )
        : Text(
            widget.message,
            style: AppTextStyles.text14Regular.copyWith(height: 1.5.h),
          )),
      )  
    );
  }

  //-------------------------------------------------------------
  BorderRadius _getBorderRadius() {
    final normal = Radius.circular(10.r);
    final small = Radius.circular(0.r);
    if (widget.isUser) {
      if (widget.isArabic) {
        return BorderRadius.only(
          topLeft: small,
          topRight: normal,
          bottomLeft: normal,
          bottomRight: normal,
        );
      } else {
        return BorderRadius.only(
          topLeft: normal,
          topRight: small,
          bottomLeft: normal,
          bottomRight: normal,
        );
      }
    } else {
      if (widget.isArabic) {
        return BorderRadius.only(
          topLeft: normal,
          topRight: small,
          bottomLeft: normal,
          bottomRight: normal,
        );
      } else {
        return BorderRadius.only(
          topLeft: small,
          topRight: normal,
          bottomLeft: normal,
          bottomRight: normal,
        );
      }
    }
  }
}
