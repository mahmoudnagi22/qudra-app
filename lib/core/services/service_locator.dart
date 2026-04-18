import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:qodraapp/core/services/api_services.dart';
import 'package:qodraapp/core/services/network_info.dart';
import 'package:qodraapp/features/Auth/data/data%20sources/remote_data_source.dart';
import 'package:qodraapp/features/Auth/data/repos/auth_repo_imp.dart';
import 'package:qodraapp/features/chatbot/data/data%20sources/remote_data_source.dart';
import 'package:qodraapp/features/chatbot/data/repos/ai_repo_imp.dart';
import 'package:qodraapp/features/home/data/data%20sources/local_data_source.dart';
import 'package:qodraapp/features/home/data/data%20sources/remote_data_source.dart';
import 'package:qodraapp/features/home/data/repos/HomeRepoImp.dart';
import 'package:qodraapp/features/notifications/data/data%20sources/notifications_local_data_source.dart';
import 'package:qodraapp/features/notifications/data/data%20sources/notifications_remote_data_source.dart';
import 'package:qodraapp/features/notifications/data/repos/notifications_repo_imp.dart';
import 'package:qodraapp/features/settings/data/data%20sources/settings_remote_data_sources.dart';
import 'package:qodraapp/features/settings/data/repos/settings_repo_imp.dart';
import 'package:qodraapp/core/utlis/constants.dart';

final getIt = GetIt.instance;

void setup() {
  // ---------- Core ----------
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 120,
      ),
    );

    return dio;
  });
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(getIt<Dio>()),
  );

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfo(),
  );

  // ---------- Repos ----------
  getIt.registerLazySingleton<AuthRepoImp>(
    () => AuthRepoImp(RemoteDataSourceImp(getIt<ApiServices>()) , getIt<NetworkInfo>()),
  );

  getIt.registerLazySingleton<HomeRepoImp>(
    () => HomeRepoImp(
      remoteDataSource:
          HomeRemoteDataSourceImpl(apiServices: getIt<ApiServices>()),
      localDataSource: HomeLocalDataSourceImpl(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  getIt.registerLazySingleton<AiRepoImp>(
    () => AiRepoImp(RemoteDataSourceImpAi(getIt<ApiServices>())),
  );

  getIt.registerLazySingleton<SettingsRepoImp>(
    () => SettingsRepoImp(
        remoteDataSources:
            SettingsRemoteDataSourcesImpl(apiServices: getIt<ApiServices>())),
  );

  getIt.registerLazySingleton<NotificationsRepoImp>(
    () => NotificationsRepoImp(notificationsRemoteDataSourceImp: NotificationsRemoteDataSourceImp(getIt<ApiServices>()), 
    notificationsLocalDataSourceImp: NotificationsLocalDataSourceImp(), networkInfo: NetworkInfo())
  );
}
