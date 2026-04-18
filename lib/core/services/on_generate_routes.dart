import 'package:flutter/material.dart';
import 'package:qodraapp/core/functions/fade_transition.dart';
import 'package:qodraapp/core/utlis/app_routes_name.dart';
import 'package:qodraapp/features/Auth/presentation/views/forget_password.dart';
import 'package:qodraapp/features/Auth/presentation/views/login_screen.dart';
import 'package:qodraapp/features/Auth/presentation/views/otp_view.dart';
import 'package:qodraapp/features/Auth/presentation/views/reset_password_view.dart';
import 'package:qodraapp/features/chatbot/presentation/views/chatbot_view.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';
import 'package:qodraapp/features/home/presentation/views/car_details_view.dart';
import 'package:qodraapp/features/home/presentation/views/home_view_providers.dart';
import 'package:qodraapp/features/home/presentation/views/serivices_history_view.dart';
import 'package:qodraapp/features/home/presentation/views/workshop_view.dart';
import 'package:qodraapp/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:qodraapp/features/onboarding/presentation/views/welcome_screen.dart';
import 'package:qodraapp/features/settings/presentation/views/Pending_Review_Transfer.dart';
import 'package:qodraapp/features/settings/presentation/views/accept_request_view.dart';
import 'package:qodraapp/features/settings/presentation/views/reject_request_view.dart';
import 'package:qodraapp/features/settings/presentation/views/workshop_transfer_view.dart';
import 'package:qodraapp/features/splash_screen/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.splashScreen:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
        settings: settings,
      );

    case RoutesName.onboardingScreen:
      return buildFadeRoute(
        page: const OnboardingView(),
        settings: settings,
      );

    case RoutesName.welcomeScreen:
      return buildFadeRoute(
        page: const WelcomeView(),
        settings: settings,
      );

    case RoutesName.signInScreen:
      return buildFadeRoute(
        page: const LoginView(),
        settings: settings,
      );

    case RoutesName.forgotPasswordScreen:
      return buildFadeRoute(
        page: const ForgetPasswordView(),
        settings: settings,
      );
    case RoutesName.otpVerfication:
    final String PhoneNum = settings.arguments as String ;
      return buildFadeRoute(
        page:  OtpView( phoneNum: PhoneNum,  
        ),
        settings: settings,
        
      );
    case RoutesName.resetPasswordScreen:
      final String PhoneNum = settings.arguments as String ;
      return buildFadeRoute(
        page:  ResetPasswordView(phoneNum: PhoneNum,),
        settings: settings,
      );
    case RoutesName.homeScreen:
      return buildFadeRoute(
        page: const HomeViewProviders(),
        settings: settings,
      );
    case RoutesName.workshopDetailsScreen:
      final WorkShopEntity workShopEntity =
          settings.arguments as WorkShopEntity;
      return buildFadeRoute(
        page: WorkShopView(
          workShopEntity: workShopEntity,
        ),
        settings: settings,
      );
    case RoutesName.carDetailsScreen:
      final cardetails = settings.arguments as CarsInfoEntity;
      return buildFadeRoute(
        page: CarDetailsView(
          carsInfoEntity: cardetails,
        ),
        settings: settings,
      );
    case RoutesName.servicesHistoryScreen:
      final args = settings.arguments as Map<String, dynamic>;
      final sessionsList = args['sessionsList'] as List<ServiceEntity>;

      return buildFadeRoute(
        page: ServiceHistoryView(
          sessionsList: sessionsList, 
        ),
        settings: settings,
      );
    case RoutesName.workShopTransfer:
      return buildFadeRoute(
        page: const WorkShopTransferView(),
        settings: settings,
      );
    case RoutesName.pendingRequest:
      return buildFadeRoute(
        page: const PendingTransferView(),
        settings: settings,
      );
    case RoutesName.acceptRequestView:
      return buildFadeRoute(
        page: const AcceptRequestView(),
        settings: settings,
      );
    case RoutesName.rejectRequestView:
      return buildFadeRoute(
        page: const RejectRequestView(),
        settings: settings,
      );
    case RoutesName.chatbotScreen:
      return buildFadeRoute(
        page: const ChatBotView(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
        settings: settings,
      );
  }
}
