import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uncle_bob/core/network/network_info.dart';
import 'package:uncle_bob/feature/auth/data/datasources/local_datasource.dart';
import 'package:uncle_bob/feature/auth/data/datasources/remote_datasource.dart';
import 'package:uncle_bob/feature/auth/data/repository/auth_repository_imp.dart';
import 'package:uncle_bob/feature/auth/domain/repository/auth_repository.dart';
import 'package:uncle_bob/feature/auth/domain/usecase/delete_user_usecase.dart';
import 'package:uncle_bob/feature/auth/domain/usecase/forgot_password_usecase.dart';
import 'package:uncle_bob/feature/auth/domain/usecase/is_auth_usecase.dart';
import 'package:uncle_bob/feature/auth/domain/usecase/login_usecase.dart';
import 'package:uncle_bob/feature/auth/domain/usecase/registre_usecase.dart';
import 'package:uncle_bob/feature/auth/presentation/bloc/forgot_and_delete_user_and_isauth/auth2_bloc.dart';
import 'package:uncle_bob/feature/auth/presentation/bloc/login_and_register_bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Feature - auth
  // bloc
  sl.registerFactory(() => AuthBloc(
        loginUseCase: sl(),
        registerUseCase: sl(),
      ));
  sl.registerFactory(() => Auth2Bloc(
        forgotPasswordUseCase: sl(),
        isAuthUseCase: sl(),
        deleteUserUseCase: sl(),
      ));

  // use case
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => IsAuthUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => DeleteUserUseCase(authRepository: sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));

  // Data Source
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(client: sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp(sharedPreferences: sl()));

  /// core

  // network connection
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(internetConnectionChecker: sl()));

  /// External

  // sharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // http client
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
