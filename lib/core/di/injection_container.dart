import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/users/data/datasources/user_remote_data_source.dart';
import '../../features/users/data/repositories/user_repository_impl.dart';
import '../../features/users/domain/repositories/user_repository.dart';
import '../../features/users/domain/usecases/get_user_by_id.dart';
import '../../features/users/domain/usecases/get_users.dart';
import '../../features/users/presentation/cubit/user_detail_cubit.dart';
import '../../features/users/presentation/cubit/users_cubit.dart';
import '../network/api_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Users
  // Cubits
  sl.registerFactory(() => UsersCubit(getUsers: sl()));
  sl.registerFactory(() => UserDetailCubit(getUserById: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton(() => GetUserById(sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(apiClient: sl()),
  );

  // Core
  sl.registerLazySingleton(() => ApiClient(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
}
