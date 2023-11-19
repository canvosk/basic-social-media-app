import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/local/local_storage_services.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/authentication_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/data_sources/remote/firebase_storage_service.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/repository/authentication_repository_imp.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/data/repository/local_storage_repository_imp.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/authentication_repository.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/repository/local_storage_repository.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/local_storage_usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/login_usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/register_usecase.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/local_storage_bloc/local_storage_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dependencies

  sl.registerSingleton<AuthenticationService>(AuthenticationService());
  sl.registerSingleton<FirebaseStorageService>(FirebaseStorageService());
  sl.registerSingleton<LocalStorageService>(LocalStorageService());
  LocalStorageService().init();

  sl.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImp(sl(), sl()));
  sl.registerSingleton<LocalStorageRepository>(LocalStorageRepositoryImp(sl()));

  //UseCases
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<LocalStorageUseCase>(LocalStorageUseCase(sl()));

  //Blocs
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
  sl.registerFactory<LocalStorageBloc>(() => LocalStorageBloc(sl()));
}
