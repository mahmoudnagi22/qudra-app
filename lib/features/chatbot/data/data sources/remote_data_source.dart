import 'package:dio/dio.dart';
import 'package:qodraapp/core/services/api_services.dart';
import 'package:qodraapp/features/chatbot/domain/entities/messageEntity.dart';

abstract class RemoteDataSourceAi {
  Future<MessageEntity>  getAiResponse({required String msg});
}

class RemoteDataSourceImpAi implements RemoteDataSourceAi{
  ApiServices apiServices ; 
  RemoteDataSourceImpAi(this.apiServices);
  @override
 Future<MessageEntity> getAiResponse({required String msg}) async {
   Response response = await apiServices.postData(
    endPoint: '/api/Ai/AskAi', 
    queryParameters: {
      'userPrompt' : msg ,
    }, data: null, isFormData: false,
   ) ; 
   String data = response.data['response'] ;
   return MessageEntity(isUser: false, message: data); 
  }
}