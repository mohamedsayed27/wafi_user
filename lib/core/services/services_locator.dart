import 'package:get_it/get_it.dart';
import 'package:wafi_user/presentation/business_logic/cart_cubit/cart_cubit.dart';

import '../../data/data_source/remote_data_source/address_data_source.dart';
import '../../data/data_source/remote_data_source/auth_remote_data_source.dart';
import '../../data/data_source/remote_data_source/car_service_and_maintenance_data_source.dart';
import '../../data/data_source/remote_data_source/car_spare_parts_remote_data_source.dart';
import '../../data/data_source/remote_data_source/cars_remote_data_source.dart';
import '../../presentation/business_logic/address_cubit/address_cubit.dart';
import '../../presentation/business_logic/auth_cubit/auth_cubit.dart';
import '../../presentation/business_logic/car_service_cubit/car_service_cubit.dart';
import '../../presentation/business_logic/car_spare_parts_cubit/car_spare_by_parts_cubit.dart';
import '../../presentation/business_logic/car_spare_parts_cubit/car_spare_by_quotation_cubit.dart';
import '../../presentation/business_logic/cars_cubti/cars_cubit.dart';
import '../network/dio_helper.dart';
import 'google_maps_services.dart';

GetIt sl = GetIt.instance;

class ServicesLocator {
  static void init() {
    /// API Methods Class (DIO)
    sl.registerLazySingleton(() => DioHelper());

    /// Google Maps Service
    sl.registerLazySingleton(() => LocationService(sl()));

    /// Datasource
    sl.registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(dioHelper: sl<DioHelper>()));
    sl.registerFactory<CarsRemoteDataSource>(
        () => CarsRemoteDataSource(dioHelper: sl<DioHelper>()));
    sl.registerFactory<AddressDataSource>(() => AddressDataSource(dioHelper: sl<DioHelper>()));
    sl.registerFactory<CarServiceAndMaintenanceDataSource>(
        () => CarServiceAndMaintenanceDataSource(dioHelper: sl<DioHelper>()));
    sl.registerFactory<CarSparePartsRemoteDataSource>(
        () => CarSparePartsRemoteDataSource(dioHelper: sl<DioHelper>()));

    /// Cubits
    sl.registerFactory<AuthCubit>(() => AuthCubit(sl<AuthRemoteDataSource>()));
    sl.registerFactory<CarSpareByQuotationCubit>(
        () => CarSpareByQuotationCubit(sl<CarSparePartsRemoteDataSource>()));
    sl.registerFactory<CarSparePartsCubit>(
        () => CarSparePartsCubit(sl<CarSparePartsRemoteDataSource>()));
    sl.registerFactory<AddressCubit>(
        () => AddressCubit(sl<AddressDataSource>(), sl<LocationService>()));
    sl.registerFactory<CarServiceCubit>(
        () => CarServiceCubit(sl<CarServiceAndMaintenanceDataSource>(), sl()));
    sl.registerLazySingleton<CartCubit>(() => CartCubit());
    sl.registerLazySingleton<CarsCubit>(() => CarsCubit(sl<CarsRemoteDataSource>()));
  }
}
