import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/chatbot/presentation/views/widgets/custom_chat_text_field.dart';
import 'package:qodraapp/features/chatbot/presentation/views/widgets/send_container.dart';
import 'package:qodraapp/generated/l10n.dart';

class SendTextRow extends StatelessWidget {
  const SendTextRow({
    super.key,
    this.onPressed,
    required this.textEditingController,
  });
  final Function()? onPressed;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Row(
        children: [
          Expanded(
              child: CustomChatTextField(
                  textEditingController: textEditingController,
                  txt: S.of(context).input_placeholder)),
          SizedBox(
            width: 5.h,
          ),
          SendContainer(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
