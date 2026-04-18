import 'package:dartz/dartz.dart';
import 'package:qodraapp/core/errors/faluire.dart';
import 'package:qodraapp/features/chatbot/domain/entities/messageEntity.dart';

abstract class AiRepo {
 Future<Either<Failure , MessageEntity>> getAiResponse({required String msg});
}