import 'package:get_it/get_it.dart';
import 'package:wafi_user/data/data_source/remote_data_source/cars_remote_data_source.dart';
import 'package:wafi_user/presentation/business_logic/auth_cubit/auth_cubit.dart';
import 'package:wafi_user/presentation/business_logic/cars_cubti/cars_cubit.dart';

import '../../data/data_source/remote_data_source/auth_remote_data_source.dart';
import '../network/dio_helper.dart';

GetIt sl = GetIt.instance;

class ServicesLocator{
  static void init(){
    /// Datasource
    sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(dioHelper: sl<DioHelper>()));
    sl.registerLazySingleton<CarsRemoteDataSource>(() => CarsRemoteDataSource(dioHelper: sl<DioHelper>()));
    /// API Methods Class (DIO)
    sl.registerLazySingleton(() => DioHelper());
    /// Cubits
    sl.registerFactory<AuthCubit>(()=> AuthCubit(sl<AuthRemoteDataSource>()));
    sl.registerFactory<CarsCubit>(()=> CarsCubit(sl<CarsRemoteDataSource>()));
  }
}
