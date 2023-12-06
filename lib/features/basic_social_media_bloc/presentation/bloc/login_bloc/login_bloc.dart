import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/usecases/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginLoading());
      try {
        UserEntity user = await _loginUseCase.call(params: event.user);
        emit(LoginSuccess(user));
      } catch (e) {
        emit(LoginFailed(e.toString()));
      }
    });
  }
}
