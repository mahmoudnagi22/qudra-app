import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/features/chatbot/domain/entities/messageEntity.dart';
import 'package:qodraapp/features/chatbot/presentation/manager/ai_cubit/ai_cubit.dart';
import 'package:qodraapp/features/chatbot/presentation/manager/ai_cubit/ai_states.dart';
import 'package:qodraapp/features/chatbot/presentation/views/widgets/ai_bubble.dart';
import 'package:qodraapp/features/chatbot/presentation/views/widgets/loading_indicator.dart';
import 'package:qodraapp/features/chatbot/presentation/views/widgets/send_text_row.dart';
import 'package:qodraapp/features/chatbot/presentation/views/widgets/user_bubble.dart';
import 'package:qodraapp/generated/l10n.dart';

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({super.key});

  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool _isFirstMessageAdded = false;
  final List<MessageEntity> messages = [
    //MessageEntity(isUser: false, message:  l)
  ];
  addFirstMessage() {
      messages
          .add(MessageEntity(isUser: false, message: S.of(context).message));
      _isFirstMessageAdded = true;
  }

  @override
  Widget build(BuildContext context) {
    if(!_isFirstMessageAdded){
      addFirstMessage() ; 
      setState(() {
        
      });
    }
    return Column(
      children: [
        BlocConsumer<AiCubit, AiStates>(
          listener: (context, state) {
            if (state is AiResponseSucsess) {
              messages.add(state.messageEntity);
              scrollToBottom();
            } else if (state is AiResponseFaluire) {
              messages.add(MessageEntity(
                isUser: false,
                message: 'Oops! Something went wrong.',
              ));
              scrollToBottom();
            }
          },
          builder: (context, state) {
            return Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: state is AiResponseLoading
                      ? messages.length + 1
                      : messages.length,
                  itemBuilder: (context, index) {
                    if (index == messages.length &&
                        state is AiResponseLoading) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        child: const TypingIndicator(),
                      );
                    }
                    return messages[index].isUser
                        ? UserBubble(msg: messages[index].message)
                        : AiBubble(
                            msg: messages[index].message,
                            messageEntity: messages[index],
                          );
                  }),
            );
          },
        ),
        SendTextRow(
          onPressed: onPressed,
          textEditingController: textEditingController,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
  //-------------------------------------------------------

  void onPressed() {
    setState(() {
      messages.add(
        MessageEntity(
          isUser: true,
          message: textEditingController.text,
        ),
      );
    });
    BlocProvider.of<AiCubit>(context)
        .getAiResponse(msg: textEditingController.text);
    textEditingController.clear();
    scrollToBottom();
  }

  //-------------------------------------------------------
  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
