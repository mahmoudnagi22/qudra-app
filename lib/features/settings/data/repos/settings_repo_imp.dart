import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qodraapp/core/errors/faluire.dart';
import 'package:qodraapp/features/settings/data/data%20sources/settings_remote_data_sources.dart';
import 'package:qodraapp/features/settings/domain/repos/setttings_repo.dart';

class SettingsRepoImp implements SetttingsRepo {
  SettingsRemoteDataSources remoteDataSources;
  SettingsRepoImp({required this.remoteDataSources});
  @override
  Future<Either<Failure, void>> transferWorkshop(
      {required String token,
      required String fromCode,
      required String toCode,
      required String reason}) async {
    try {
      await remoteDataSources.transferWorkshop(
        token: token,
        fromCode: fromCode,
        toCode: toCode,
        reason: reason,
      );
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.FromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
