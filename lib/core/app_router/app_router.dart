import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/presentation/business_logic/address_cubit/address_cubit.dart';
import 'package:wafi_user/presentation/business_logic/car_service_cubit/car_service_cubit.dart';
import 'package:wafi_user/presentation/screens/address_screens/add_address_screen.dart';
import 'package:wafi_user/presentation/screens/auth_screens/complete_profile_data_screen.dart';
import 'package:wafi_user/presentation/screens/auth_screens/login_screen.dart';
import 'package:wafi_user/presentation/screens/auth_screens/otp_screen.dart';
import 'package:wafi_user/presentation/screens/auth_screens/register_screen.dart';
import 'package:wafi_user/presentation/screens/booking_screens/offers_screen.dart';
import 'package:wafi_user/presentation/screens/car_insurance/add_driver_screen.dart';
import 'package:wafi_user/presentation/screens/car_insurance/car_insurance.dart';
import 'package:wafi_user/presentation/screens/car_insurance/car_insurance_result.dart';
import 'package:wafi_user/presentation/screens/car_insurance/due_for_renewl.dart';
import 'package:wafi_user/presentation/screens/car_insurance/existing_polices.dart';
import 'package:wafi_user/presentation/screens/car_insurance/expired_polices.dart';
import 'package:wafi_user/presentation/screens/car_insurance/insurance_details_screen.dart';
import 'package:wafi_user/presentation/screens/car_insurance/policy_details_screen.dart';
import 'package:wafi_user/presentation/screens/car_rent/car_rent_details.dart';
import 'package:wafi_user/presentation/screens/car_rent/choose_driver_type_screen.dart';
import 'package:wafi_user/presentation/screens/car_rent/search_to_rent_car_screen.dart';
import 'package:wafi_user/presentation/screens/intro_screens/select_language_screen.dart';
import 'package:wafi_user/presentation/screens/intro_screens/splash_screen.dart';
import 'package:wafi_user/presentation/screens/intro_screens/welcome_screen.dart';
import 'package:wafi_user/presentation/screens/main_layout/main_layout.dart';
import 'package:wafi_user/presentation/screens/payment_methods/payment_methods_screen.dart';
import 'package:wafi_user/presentation/screens/profile_screens/change_password_screen.dart';
import 'package:wafi_user/presentation/screens/profile_screens/edit_profile_screen.dart';
import 'package:wafi_user/presentation/screens/reservation_screens/confirm_reservation_screen.dart';
import 'package:wafi_user/presentation/screens/services_and_maintanance/service_aand_maintanance_screen.dart';
import 'package:wafi_user/presentation/screens/services_on_map_screen/services_on_map_screen.dart';
import 'package:wafi_user/presentation/screens/cars_screen/add_your_car.dart';
import 'package:wafi_user/presentation/screens/spare_parts/spare_by_parts_screen.dart';
import 'package:wafi_user/presentation/screens/spare_parts/spare_by_quotation_screen.dart';
import 'package:wafi_user/presentation/screens/spare_parts/spare_parts_details_screen.dart';
import 'package:wafi_user/presentation/screens/spare_parts/spare_parts_screen.dart';
import 'package:wafi_user/presentation/screens/support_screen/chat_support_screen.dart';
import 'package:wafi_user/presentation/screens/support_screen/support_screen.dart';
import 'package:wafi_user/presentation/screens/terms_and_conditions_privacy_policy/terms_conditions.dart';
import 'package:wafi_user/presentation/screens/wallet_screens/saved_caerds_screen.dart';
import 'package:wafi_user/presentation/screens/wallet_screens/wallet_screen.dart';

import '../../presentation/screens/address_screens/address_google_maps_screen.dart';
import '../../presentation/screens/address_screens/address_screens.dart';
import '../../presentation/screens/car_insurance/insurance_payment.dart';
import '../../presentation/screens/car_insurance/new_insurance_screen.dart';
import '../../presentation/screens/car_rent/confirm_rent_car_screen.dart';
import '../../presentation/screens/car_rent/filtered_rent_screen.dart';
import '../../presentation/screens/cars_screen/my_cars_screen.dart';
import '../../presentation/screens/carts_screen/services_cart_screen.dart';
import '../../presentation/screens/payment_methods/add_payment_method_screen.dart';
import '../../presentation/screens/reservation_screens/order_progress_screen.dart';
import '../../presentation/screens/review_screen/review_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case ScreenName.splashScreen:
          return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
          );
        case ScreenName.selectLanguageScreen:
          return MaterialPageRoute(
            builder: (_) => const SelectLanguageScreen(),
          );
        case ScreenName.welcomeScreen:
          return MaterialPageRoute(
            builder: (_) => const WelcomeScreen(),
          );
        case ScreenName.myCarsScreen:
          return MaterialPageRoute(
            builder: (_) => const MyCarsScreen(),
          );
        case ScreenName.loginScreen:
          return MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          );
        case ScreenName.registerScreen:
          return MaterialPageRoute(
            builder: (_) => const RegisterScreen(),
          );
        case ScreenName.otpScreen:
          return MaterialPageRoute(
            builder: (_) => const OtpScreen(),
          );
        case ScreenName.reviewScreen:
          return MaterialPageRoute(
            builder: (_) => const ReviewScreen(),
          );
        case ScreenName.paymentMethodsScreen:
          return MaterialPageRoute(
            builder: (_) => const PaymentMethodsScreen(),
          );
        case ScreenName.confirmReservationsScreen:
          final String args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => ConfirmReservationScreen(
              appBarTitle: args,
            ),
          );
        case ScreenName.addPaymentMethodsScreen:
          return MaterialPageRoute(
            builder: (_) => const AddPaymentMethodScreen(),
          );
        case ScreenName.completeProfileData:
          return MaterialPageRoute(
            builder: (_) => const CompleteProfileDataScreen(),
          );
        case ScreenName.mainLayoutScreen:
          return MaterialPageRoute(
            builder: (_) => const MainLayout(),
          );
        case ScreenName.servicesAndMaintenanceScreen:
          return MaterialPageRoute(
            builder: (context) => const ServiceAndMaintenanceScreen(),
          );
        case ScreenName.carRentDetails:
          return MaterialPageRoute(
            builder: (_) => const CarRentDetails(),
          );
        case ScreenName.chooseDriverTypeScreen:
          return MaterialPageRoute(
            builder: (_) => const ChooseDriverTypeScreen(),
          );
        case ScreenName.orderProgressScreen:
          return MaterialPageRoute(
            builder: (_) => const OrderProgressScreen(),
          );
        case ScreenName.chatScreen:
          return MaterialPageRoute(
            builder: (_) => const ChatSupportScreen(),
          );
        case ScreenName.existingPolicesScreen:
          return MaterialPageRoute(
            builder: (_) => const ExistingPolices(),
          );
        case ScreenName.expiredPolices:
          return MaterialPageRoute(
            builder: (_) => const ExpiredPolices(),
          );
        case ScreenName.addDriverScreen:
          final int args = settings.arguments as int;
          return MaterialPageRoute(
            builder: (_) => AddDriverScreen(currentIndex: args),
          );
        case ScreenName.carInsuranceScreen:
          return MaterialPageRoute(
            builder: (_) => const CarInsurance(),
          );
        case ScreenName.carInsuranceResult:
          return MaterialPageRoute(
            builder: (_) => const CarInsuranceResult(),
          );
        case ScreenName.dueForRenewal:
          return MaterialPageRoute(
            builder: (_) => const DueForRenewal(),
          );
        case ScreenName.insuranceDetails:
          return MaterialPageRoute(
            builder: (_) => const InsuranceDetailsScreen(),
          );
        case ScreenName.newInsuranceScreen:
          return MaterialPageRoute(
            builder: (_) => const AddNewInsuranceScreen(),
          );
        case ScreenName.policyDetailsScreen:
          return MaterialPageRoute(
            builder: (_) => const PolicesDetailsScreen(),
          );
        case ScreenName.offerScreen:
          return MaterialPageRoute(
            builder: (_) => const OffersScreen(),
          );
        case ScreenName.searchToRentCarScreen:
          return MaterialPageRoute(
            builder: (_) => const SearchToRentCarScreen(),
          );
        case ScreenName.confirmRentCarScreen:
          return MaterialPageRoute(
            builder: (_) => const ConfirmRentCarScreen(),
          );
        case ScreenName.sparePartsDetailsScreen:
          return MaterialPageRoute(
            builder: (_) => const SparePartsDetailsScreen(),
          );
        case ScreenName.servicesOnMapScreen:
          final args = settings.arguments as ServiceOnMapScreenArgs;
          return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: args.cubit,
              child: ServicesOnMapScreen(
                screenArgs: args,
              ),
            ),
          );
        case ScreenName.addAddressScreen:
          final args = settings.arguments as List;
          return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: (args[0] as AddressCubit)..getUserCurrentLocation(),
              child: const AddAddressScreen(),
            ),
          );
        case ScreenName.addressScreen:
          final args = settings.arguments as List;
          return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: (args[0] as AddressCubit)..getUserAddressList(),
              child: const AddressScreen(),
            ),
          );
        case ScreenName.walletScreen:
          return MaterialPageRoute(
            builder: (_) => const WalletScreen(),
          );
        case ScreenName.editProfileScreen:
          return MaterialPageRoute(
            builder: (_) => const EditProfileScreen(),
          );
        case ScreenName.savedCardsScreen:
          return MaterialPageRoute(
            builder: (_) => const SavedCardsScreen(),
          );
        case ScreenName.changePasswordScreen:
          return MaterialPageRoute(
            builder: (_) => const ChangePasswordScreen(),
          );
        case ScreenName.servicesCartScreen:
          final args = settings.arguments as List;
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: args[1] as CarServiceCubit,
              child: ServicesCartScreen(servicesType: args[0]),
            ),
          );
        case ScreenName.addressGoogleMap:
          final args = settings.arguments as List;
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: (args[0] as AddressCubit),
              child: const AddressGoogleMapsScreen(),
            ),
          );
        case ScreenName.supportChatScreen:
          return MaterialPageRoute(
            builder: (_) => const SupportScreen(),
          );
        case ScreenName.insurancePaymentScreen:
          return MaterialPageRoute(
            builder: (_) => const InsurancePaymentScreen(),
          );
        case ScreenName.addYorCar:
          return MaterialPageRoute(
            builder: (_) => const AddYourCar(),
          );
        case ScreenName.sparePartsScreen:
          return MaterialPageRoute(
            builder: (_) => const SparePartsScreen(),
          );
        case ScreenName.spareByPartsScreen:
          return MaterialPageRoute(
            builder: (_) => SpareByPartsScreen(),
          );
        case ScreenName.spareByQuotationScreen:
          return MaterialPageRoute(
            builder: (_) => const SpareByQuotationScreen(),
          );
        case ScreenName.filteredRentCarScreen:
          return MaterialPageRoute(
            builder: (_) => const FilteredRentScreen(),
          );
        case ScreenName.termsAndConditions:
          final title = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (_) => TermsConditions(
              title: title ?? "",
            ),
          );

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
