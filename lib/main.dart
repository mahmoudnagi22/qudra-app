import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:qodraapp/core/cubits/localization_cubit/localization_cubit.dart';
import 'package:qodraapp/core/cubits/localization_cubit/localization_cubit_states.dart';
import 'package:qodraapp/core/services/bloc_observer.dart';
import 'package:qodraapp/core/services/get_device_id.dart';
import 'package:qodraapp/core/services/on_generate_routes.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/services/service_locator.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/domain/entities/user_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';
import 'package:qodraapp/features/notifications/domain/entites/notification_entity.dart';
import 'package:qodraapp/generated/l10n.dart';

import 'features/notifications/messaging_config.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1) Firebase init
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 2) Register background handler
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // 3) App services
  setup();
  await SharedPrefs.init();
  await SecurePrefs.init();
  await getDeviceId();
  // 4) Init local notifications + FCM handlers + print token
  await MessagingConfig.init();

  // 5) Hive init
  await Hive.initFlutter();
  Hive.registerAdapter(UserInfoEntityAdapter());
  Hive.registerAdapter(CarsInfoEntityAdapter());
  Hive.registerAdapter(ServiceEntityAdapter());
  Hive.registerAdapter(WorkShopEntityAdapter());
  Hive.registerAdapter(NotificationEntityAdapter());
  await Hive.openBox<UserInfoEntity>(userInfoDataKeyBox);
  await Hive.openBox<CarsInfoEntity>(carsInfoDataBox);
  await Hive.openBox<ServiceEntity>(servicesDataBox);
  await Hive.openBox<WorkShopEntity>(workShopsDataBox);
  await Hive.openBox<ServiceEntity>(carServicesDataBox);
  await Hive.openBox<List<NotificationEntity>>(notificationBox);

  // 6) Bloc observer
  Bloc.observer = MyBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalizationCubit(),
        ),
      ],
      child: const Qodra(),
    ),
  );
}

class Qodra extends StatelessWidget {
  const Qodra({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocBuilder<LocalizationCubit, LocalizationType>(
        builder: (context, state) {
          Locale locale = const Locale('ar');
          if (state is LoadedLocalization) {
            locale = state.locale;
            SharedPrefs.setString(
                selectedLanguageType, state.locale.languageCode);
          }

          return MaterialApp(
            navigatorKey: rootNavigatorKey,
            theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: locale,
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
            initialRoute: RoutesName.splashScreen,
          );
        },
      ),
    );
  }
}
