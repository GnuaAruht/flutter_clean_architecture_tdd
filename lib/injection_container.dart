import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'features/get_users/data/data_source/user_remote_data_source.dart';
import 'features/get_users/data/repository/user_repository_impl.dart';
import 'features/get_users/domain/repositories/user_repository.dart';
import 'features/get_users/domain/usecases/get_user_list_usecase.dart';
import 'features/get_users/presentation/bloc/user_list_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Bloc
  sl.registerFactory(() => UserListBloc(sl.get()));

  // UseCase
  sl.registerLazySingleton(() => GetUserListUseCase(sl.get()));

  // Repository
  sl.registerLazySingleton<UserRepository>(() =>
      UserRepositoryImpl(networkInfo: sl.get(), remoteDataSource: sl.get()));

  // DataSource
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(sl.get()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl.get()));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
