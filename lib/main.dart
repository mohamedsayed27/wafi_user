import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_theme/app_theme.dart';
import 'package:wafi_user/presentation/screens/car_insurance/car_insurance_result.dart';
import 'package:wafi_user/presentation/screens/reservation_screens/confirm_reservation_screen.dart';
import 'package:wafi_user/presentation/screens/reservation_screens/order_progress_screen.dart';
import 'presentation/screens/car_insurance/new_insurance_screen.dart';
import 'presentation/screens/booking_screens/orders_screen.dart';
import 'presentation/screens/car_insurance/add_driver_screen.dart';
import 'presentation/screens/car_insurance/existing_cars.dart';
import 'presentation/screens/car_insurance/existing_polices.dart';
import 'presentation/screens/car_insurance/policy_details_screen.dart';
import 'presentation/screens/car_rent/car_rent_details.dart';
import 'presentation/screens/car_rent/choose_driver_type_screen.dart';
import 'presentation/screens/car_rent/confirm_rent_car_screen.dart';
import 'presentation/screens/car_rent/filtered_rent_screen.dart';
import 'presentation/screens/main_layout/main_layout.dart';
import 'presentation/screens/payment_methods/payment_methods_screen.dart';
import 'presentation/screens/profile_screens/profile_screens.dart';
import 'presentation/screens/spare_parts/filter_spare_parts.dart';
import 'presentation/screens/spare_parts/spare_by_parts_screen.dart';
import 'presentation/screens/spare_parts/spare_by_quotation_screen.dart';
import 'presentation/screens/spare_parts/spare_parts_details_screen.dart';
import 'presentation/screens/spare_parts/spare_parts_screen.dart';
import 'presentation/screens/wallet_screens/saved_caerds_screen.dart';

import 'core/app_router/app_router.dart';
import 'core/app_router/screens_name.dart';
import 'presentation/screens/booking_screens/offers_screen.dart';
import 'presentation/screens/car_insurance/car_insurance.dart';
import 'presentation/screens/car_insurance/due_for_renewl.dart';
import 'presentation/screens/car_insurance/expired_polices.dart';
import 'presentation/screens/car_rent/search_to_rent_car_screen.dart';
import 'presentation/screens/profile_screens/change_password_screen.dart';
import 'presentation/screens/profile_screens/edit_profile_screen.dart';
import 'presentation/screens/support_screen/chat_support_screen.dart';
import 'presentation/screens/support_screen/support_screen.dart';
import 'presentation/screens/wallet_screens/wallet_screen.dart';
import 'presentation/screens/car_insurance/insurance_details_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context , child){
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: ScreenName.splashScreen,
          // home: OrderProgressScreen(),
        );
      },
    );
  }
}
