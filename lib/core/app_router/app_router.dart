import 'package:flutter/material.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/presentation/screens/auth_screens/complete_profile_data_screen.dart';
import 'package:wafi_user/presentation/screens/auth_screens/login_screen.dart';
import 'package:wafi_user/presentation/screens/auth_screens/otp_screen.dart';
import 'package:wafi_user/presentation/screens/auth_screens/register_screen.dart';
import 'package:wafi_user/presentation/screens/car_rent/car_rent_details.dart';
import 'package:wafi_user/presentation/screens/car_rent/choose_driver_type_screen.dart';
import 'package:wafi_user/presentation/screens/car_rent/search_to_rent_car_screen.dart';
import 'package:wafi_user/presentation/screens/intro_screens/select_language_screen.dart';
import 'package:wafi_user/presentation/screens/intro_screens/splash_screen.dart';
import 'package:wafi_user/presentation/screens/intro_screens/welcome_screen.dart';
import 'package:wafi_user/presentation/screens/main_layout/main_layout.dart';
import 'package:wafi_user/presentation/screens/services_and_maintanance/service_aand_maintanance_screen.dart';
import 'package:wafi_user/presentation/screens/spare_parts/spare_parts_screen.dart';
import 'package:wafi_user/presentation/screens/support_screen/support_screen.dart';
import 'package:wafi_user/presentation/screens/terms_and_conditions_privacy_policy/terms_conditions.dart';
import 'package:wafi_user/presentation/screens/wallet_screens/wallet_screen.dart';

import '../../presentation/screens/car_rent/confirm_rent_car_screen.dart';
import '../../presentation/screens/car_rent/filtered_rent_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case ScreenName.splashScreen:
          return MaterialPageRoute(builder: (_)=>SplashScreen(),);
        case ScreenName.selectLanguageScreen:
          return MaterialPageRoute(builder: (_)=>SelectLanguageScreen(),);
        case ScreenName.welcomeScreen:
          return MaterialPageRoute(builder: (_)=>WelcomeScreen(),);
        case ScreenName.loginScreen:
          return MaterialPageRoute(builder: (_)=>LoginScreen(),);
        case ScreenName.registerScreen:
          return MaterialPageRoute(builder: (_)=>RegisterScreen(),);
        case ScreenName.otpScreen:
          return MaterialPageRoute(builder: (_)=>OtpScreen(),);
        case ScreenName.completeProfileData:
          return MaterialPageRoute(builder: (_)=>CompleteProfileDataScreen(),);
        case ScreenName.MainLayoutScreen:
          return MaterialPageRoute(builder: (_)=>MainLayout(),);
        case ScreenName.servicesAndMaintananceScreen:
          return MaterialPageRoute(builder: (_)=>ServiceAndMaintenanceScreen(),);
        case ScreenName.sparePartsScreen:
          return MaterialPageRoute(builder: (_)=>SparePartsScreen(),);
        case ScreenName.carRentDetails:
          return MaterialPageRoute(builder: (_)=>CarRentDetails(),);
        case ScreenName.chooseDriverTypeScreen:
          return MaterialPageRoute(builder: (_)=>ChooseDriverTypeScreen(),);
        case ScreenName.searchToRentCarScreen:
          return MaterialPageRoute(builder: (_)=>SearchToRentCarScreen(),);
        case ScreenName.confirmRentCarScreen:
          return MaterialPageRoute(builder: (_)=>ConfirmRentCarScreen(),);
        case ScreenName.walletScreen:
          return MaterialPageRoute(builder: (_)=>WalletScreen(),);
        case ScreenName.supportChatScreen:
          return MaterialPageRoute(builder: (_)=>SupportScreen(),);
        case ScreenName.filteredRentCarScreen:
          return MaterialPageRoute(builder: (_)=>FilteredRentScreen(),);
        case ScreenName.termsAndConditions:
          final title = settings.arguments as String;
          return MaterialPageRoute(builder: (_)=>TermsConditions(title: title,),);

        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error when routing to this screen'),
        ),
      );
    });
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.5, end: 1).animate(animation),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 250),
          reverseTransitionDuration: const Duration(milliseconds: 250),
        );
}
