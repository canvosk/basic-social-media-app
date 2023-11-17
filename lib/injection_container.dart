import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/authentication_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/storage_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/repository/authentication_repository_imp.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/authentication_repository.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/login_usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/register_usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dependencies

  sl.registerSingleton<AuthenticationService>(AuthenticationService());
  sl.registerSingleton<StorageService>(StorageService());

  sl.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImp(sl(), sl()));

  //UseCases
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));

  //Blocs
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));



}
