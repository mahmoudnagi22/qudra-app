import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qodraapp/core/errors/faluire.dart';
import 'package:qodraapp/features/chatbot/data/data%20sources/remote_data_source.dart';
import 'package:qodraapp/features/chatbot/domain/entities/messageEntity.dart';
import 'package:qodraapp/features/chatbot/domain/repos/ai_repo.dart';

class AiRepoImp implements AiRepo {
  RemoteDataSourceAi remoteDataSource;
  AiRepoImp(this.remoteDataSource);
  @override
  Future<Either<Failure, MessageEntity>> getAiResponse(
      {required String msg}) async {
    try {
      MessageEntity responseMsg =
          await remoteDataSource.getAiResponse(msg: msg);
      return right(responseMsg);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
