import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:suit_media_test_app/data/datasources/remote_datasource.dart';
import 'package:suit_media_test_app/data/repository/user_repository_impl.dart';
import 'package:suit_media_test_app/domain/repository/user_repository.dart';
import 'package:suit_media_test_app/domain/usecases/get_users.dart';
import 'package:suit_media_test_app/presentation/blocs/palindrom_bloc/palindrom_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/selected_user_bloc/selected_user_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:suit_media_test_app/presentation/blocs/username_bloc/username_bloc.dart';

final locator = GetIt.instance;

void init() {
  //external
  locator.registerLazySingleton<Dio>(() => Dio());

  //datasources
  locator.registerLazySingleton<RemoteDatasource>(
      () => RemoteDatasourceImpl(dio: locator()));

  //repository
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDatasource: locator()));

  //usecases
  locator.registerLazySingleton(() => GetUsers(repository: locator()));

  //blocs
  locator.registerFactory(() => UserNameBloc());
  locator.registerFactory(() => PalindromBloc());
  locator.registerFactory(() => SelectedUserBloc());
  locator.registerFactory(() => UserBloc(locator()));
}
