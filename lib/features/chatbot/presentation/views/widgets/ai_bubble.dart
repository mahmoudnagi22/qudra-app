import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/chatbot/domain/entities/messageEntity.dart';
import 'package:qodraapp/features/chatbot/presentation/views/widgets/customBubble.dart';
import 'package:qodraapp/features/chatbot/presentation/views/widgets/ai_photo.dart';

class AiBubble extends StatefulWidget {
  const AiBubble({super.key, required this.msg,  this.LoadingWidget, required this.messageEntity});
  final String msg;
  final Widget? LoadingWidget ; 
  final MessageEntity messageEntity ; 
  @override
  State<AiBubble> createState() => _AiBubbleState();
}

class _AiBubbleState extends State<AiBubble> {
  late bool isArabic;
  @override
  void initState() {
    isArabic = SharedPrefs.getString(selectedLanguageType) == 'ar';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChatPhoto(
                img: Assets.imagesAi,
              ),
              Expanded(
                  child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: CustomBubble(
                        messageEntity: widget.messageEntity,
                          isArabic: isArabic,
                          message: widget.msg,
                          isUser: false)))
            ],
          ),
        ),
      ],
    );
  }
}
