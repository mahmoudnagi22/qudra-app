import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qodraapp/core/errors/faluire.dart';
import 'package:qodraapp/core/services/network_info.dart';
import 'package:qodraapp/features/notifications/data/data%20sources/notifications_local_data_source.dart';
import 'package:qodraapp/features/notifications/data/data%20sources/notifications_remote_data_source.dart';
import 'package:qodraapp/features/notifications/domain/entites/notification_entity.dart';
import 'package:qodraapp/features/notifications/domain/repos/notifications_repo.dart';

class NotificationsRepoImp implements NotificationsRepo {
  NotificationsRemoteDataSourceImp notificationsRemoteDataSourceImp;
  NotificationsLocalDataSourceImp  notificationsLocalDataSourceImp ;
  NetworkInfo networkInfo ;

  NotificationsRepoImp({required this.notificationsRemoteDataSourceImp ,required this.notificationsLocalDataSourceImp  ,required this.networkInfo});
  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifactions(
      {required int notificationType, required String token}) async {
    try {
      if(!await  networkInfo.hasInternet()){
        List<NotificationEntity>? dataList = notificationsLocalDataSourceImp.getLocalNotifications(typeId: notificationType.toString());
        if(dataList != null) {
          return right(dataList);
        }
        return left(ServerFailure(errorMessage: 'No Internet Conncetion'));
      }
      List<NotificationEntity> dataList = await notificationsRemoteDataSourceImp
          .getNotifactions(notificationType: notificationType, token: token);
      return right(dataList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
