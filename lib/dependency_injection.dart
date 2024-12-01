import 'package:blog_app/core/secrets/superbase_secrets.dart';
import 'package:blog_app/core/theme/theme_cubit.dart';
import 'package:blog_app/feature/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/feature/authentication/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:blog_app/feature/authentication/data/repository/auth_repository_impl.dart';
import 'package:blog_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:blog_app/feature/authentication/domain/usecases/user_sign_up_usecase.dart';
import 'package:blog_app/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;
Future<void> init() async {
  ///.... initialization superbase
  final supabase = await Supabase.initialize(
    url: SuperbaseSecrets.superbaseUrlKey,
    anonKey: SuperbaseSecrets.superbaseAnonKey,
  );

  ///....superbase
  sl.registerLazySingleton(() => supabase.client);

  ///.... theme cubit
  sl.registerSingleton<ThemeCubit>(ThemeCubit());

  ///... data sources
  sl.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  ///....repositories
  sl.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  ///....usercases
  sl.registerFactory(() => UserSignUpUsecase(sl()));

  ///....bloc
  sl.registerLazySingleton(() => AuthBloc(userSignUpUsecase: sl()));
}
