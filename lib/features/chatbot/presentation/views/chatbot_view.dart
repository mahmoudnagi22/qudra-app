import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/services/service_locator.dart';
import 'package:qodraapp/features/chatbot/data/repos/ai_repo_imp.dart';
import 'package:qodraapp/features/chatbot/presentation/manager/ai_cubit/ai_cubit.dart';
import 'package:qodraapp/features/chatbot/presentation/views/widgets/chatbot_view_body.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AiCubit(getIt<AiRepoImp>()),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: const Scaffold(
          body: ChatBotViewBody(),
        ),
      ),
    );
  }
}
