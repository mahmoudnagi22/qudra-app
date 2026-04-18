import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/chatbot/presentation/views/widgets/customBubble.dart';
import 'package:qodraapp/features/chatbot/presentation/views/widgets/ai_photo.dart';

class UserBubble extends StatefulWidget {
  const UserBubble({super.key, required this.msg});
  final String msg;

  @override
  State<UserBubble> createState() => _UserBubbleState();
}

class _UserBubbleState extends State<UserBubble> {
  late bool isArabic;
  @override
  void initState() {
    isArabic = SharedPrefs.getString(selectedLanguageType) == 'ar';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: CustomBubble(
                    isArabic: isArabic,
                    message:widget.msg,
                    isUser: true,
                  ))),
          const ChatPhoto(img: Assets.imagesUser),
        ],
      ),
    );
  }
}
