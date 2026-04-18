import 'package:qodraapp/features/chatbot/domain/entities/messageEntity.dart';

abstract class AiStates {}

class AiResponseinit extends AiStates {}

class AiResponseLoading extends AiStates {}

class AiResponseSucsess extends AiStates {
  final MessageEntity messageEntity;
  AiResponseSucsess(this.messageEntity);
}

class AiResponseFaluire extends AiStates {
  final String errorMsg;
  AiResponseFaluire(this.errorMsg);
}
